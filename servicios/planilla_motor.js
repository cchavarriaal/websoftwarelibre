const { ejecutarConsulta } = require('../db.js');

class PlanillaMotor {
    constructor() { }

    /**
     * Procesa la planilla para un periodo específico
     * @param {number} periodoId ID del periodo a procesar
     */
    async procesarPlanilla(periodoId) {
        try {
            // 1. Obtener información del periodo
            const periodo = await ejecutarConsulta("SELECT * FROM periodos_planilla WHERE id = ?", [periodoId]);
            if (!periodo || periodo.length === 0) throw new Error("Periodo no encontrado");
            if (periodo[0].estado === 'Cerrado') throw new Error("El periodo ya está cerrado y no se puede procesar");

            // 2. Obtener empleados activos
            const empleados = await ejecutarConsulta("SELECT id, salario_base, nombre, apellido FROM empleados WHERE estado = 1");

            // 3. Obtener conceptos de ley (para cálculos automáticos)
            const conceptosLey = await ejecutarConsulta("SELECT id, nombre, tipo, porcentaje, monto_fijo FROM conceptos WHERE es_ley = 1");

            const resultados = [];

            for (const emp of empleados) {
                let totalIngresos = parseFloat(emp.salario_base);
                let totalDeducciones = 0;

                // A. Calcular deducciones/ingresos de ley automáticos
                for (const concepto of conceptosLey) {
                    let monto = 0;
                    
                    // Si es CCSS, usamos el porcentaje
                    if (concepto.nombre.includes('CCSS') || concepto.id === 1) {
                        monto = (parseFloat(emp.salario_base) * (parseFloat(concepto.porcentaje) / 100));
                    } 
                    // Si es Renta, usamos la función de tramos progresivos
                    else if (concepto.nombre.includes('Renta') || concepto.id === 2) {
                        monto = this.calcularImpuestoRenta(totalIngresos);
                    }
                    else if (concepto.porcentaje > 0) {
                        monto = (parseFloat(emp.salario_base) * (parseFloat(concepto.porcentaje) / 100));
                    } else if (concepto.monto_fijo > 0) {
                        monto = parseFloat(concepto.monto_fijo);
                    }

                    if (monto > 0) {
                        if (concepto.tipo === 'Ingreso') {
                            totalIngresos += monto;
                        } else {
                            totalDeducciones += monto;
                        }
                    }
                }

                // B. Integración de Asistencia (Llegadas Tardías)
                // Calculamos el valor de 1 minuto de trabajo
                const salarioMinuto = parseFloat(emp.salario_base) / 30 / 8 / 60;
                
                const llegadasTardias = await ejecutarConsulta(
                    `SELECT TIMESTAMPDIFF(MINUTE, h.hora_entrada, m.hora_entrada) as minutos_tarde
                     FROM marcas_asistencia m
                     JOIN empleados e ON m.empleado_id = e.id
                     JOIN horarios h ON e.horario_id = h.id
                     WHERE m.empleado_id = ? 
                     AND m.fecha BETWEEN ? AND ?
                     AND m.hora_entrada > h.hora_entrada`,
                    [emp.id, periodo[0].fecha_inicio, periodo[0].fecha_fin]
                );

                let totalDeduccionTardias = 0;
                for (const tardia of llegadasTardias) {
                    if (tardia.minutos_tarde > 0) {
                        totalDeduccionTardias += (tardia.minutos_tarde * salarioMinuto);
                    }
                }

                if (totalDeduccionTardias > 0) {
                    totalDeducciones += totalDeduccionTardias;
                    // Opcional: Podrías insertar un movimiento_planilla automático aquí para que aparezca en la boleta
                }

                // C. Obtener y sumar movimientos manuales del periodo
                const movimientos = await ejecutarConsulta(
                    `SELECT m.*, c.tipo 
                     FROM movimientos_planilla m 
                     JOIN conceptos c ON m.concepto_id = c.id 
                     WHERE m.empleado_id = ? AND m.periodo_id = ?`,
                    [emp.id, periodoId]
                );

                for (const mov of movimientos) {
                    const montoMov = parseFloat(mov.monto_calculado);
                    if (mov.tipo === 'Ingreso') {
                        totalIngresos += montoMov;
                    } else {
                        totalDeducciones += montoMov;
                    }
                }

                const salarioNeto = totalIngresos - totalDeducciones;

                // C. Guardar o actualizar en planilla_calculada
                await ejecutarConsulta(
                    `INSERT INTO planilla_calculada 
                    (empleado_id, periodo_id, salario_base_periodo, total_ingresos, total_deducciones, salario_neto) 
                    VALUES (?, ?, ?, ?, ?, ?) 
                    ON DUPLICATE KEY UPDATE 
                    salario_base_periodo = VALUES(salario_base_periodo),
                    total_ingresos = VALUES(total_ingresos),
                    total_deducciones = VALUES(total_deducciones),
                    salario_neto = VALUES(salario_neto)`,
                    [emp.id, periodoId, emp.salario_base, totalIngresos, totalDeducciones, salarioNeto]
                );

                // D. ACTUALIZAR ACUMULADOS (Aguinaldo y Vacaciones)
                // En Costa Rica, el aguinaldo es 1/12 del bruto mensual.
                const aguinaldoMes = totalIngresos / 12;
                const vacacionesMes = 1.25; // 1.25 días por mes trabajado (estándar CR)

                // Extraer mes y año de la fecha de inicio del periodo
                const fechaInicio = new Date(periodo[0].fecha_inicio);
                const mes = fechaInicio.getMonth() + 1;
                const anio = fechaInicio.getFullYear();

                await ejecutarConsulta(
                    `INSERT INTO acumulados_empleado 
                    (empleado_id, mes, anio, aguinaldo_acumulado, vacaciones_acumuladas) 
                    VALUES (?, ?, ?, ?, ?) 
                    ON DUPLICATE KEY UPDATE 
                    aguinaldo_acumulado = VALUES(aguinaldo_acumulado),
                    vacaciones_acumuladas = VALUES(vacaciones_acumuladas)`,
                    [emp.id, mes, anio, aguinaldoMes, vacacionesMes]
                );

                resultados.push({
                    empleado: `${emp.nombre} ${emp.apellido}`,
                    bruto: totalIngresos,
                    deducciones: totalDeducciones,
                    neto: salarioNeto
                });
            }

            // 4. Actualizar estado del periodo a 'Procesado'
            await ejecutarConsulta("UPDATE periodos_planilla SET estado = 'Procesado' WHERE id = ?", [periodoId]);

            return {
                mensaje: `Planilla procesada con éxito para ${empleados.length} empleados`,
                detalles: resultados
            };

        } catch (error) {
            console.error("Error en PlanillaMotor:", error);
            throw error;
        }
    }

    /**
     * Obtiene los resultados calculados de un periodo
     */
    async obtenerResultados(periodoId, empleadoId = null) {
        let query = `SELECT p.*, e.nombre, e.apellido, e.codigo_empleado, per.nombre_periodo
             FROM planilla_calculada p
             JOIN empleados e ON p.empleado_id = e.id
             JOIN periodos_planilla per ON p.periodo_id = per.id
             WHERE p.periodo_id = ?`;
        let params = [periodoId];

        if (empleadoId) {
            query += ` AND p.empleado_id = ?`;
            params.push(empleadoId);
        }

        return await ejecutarConsulta(query, params);
    }

    /**
     * Obtiene el detalle completo para una boleta de pago
     */
    async obtenerDetalleBoleta(idCalculada, empleadoId = null) {
        // 1. Obtener el resumen
        let query = `SELECT p.*, e.nombre, e.apellido, e.codigo_empleado, e.dni, e.salario_base, pu.nombre as puesto, per.nombre_periodo
             FROM planilla_calculada p
             JOIN empleados e ON p.empleado_id = e.id
             LEFT JOIN puestos pu ON e.puesto_id = pu.id
             JOIN periodos_planilla per ON p.periodo_id = per.id
             WHERE p.id = ?`;
        let params = [idCalculada];

        if (empleadoId) {
            query += ` AND p.empleado_id = ?`;
            params.push(empleadoId);
        }

        const resumen = await ejecutarConsulta(query, params);

        if (!resumen || resumen.length === 0) return null;

        const data = resumen[0];

        // 2. Obtener los movimientos detallados
        const movimientos = await ejecutarConsulta(
            `SELECT m.monto_calculado, c.nombre as concepto_nombre, c.tipo
             FROM movimientos_planilla m
             JOIN conceptos c ON m.concepto_id = c.id
             WHERE m.empleado_id = ? AND m.periodo_id = ?`,
            [data.empleado_id, data.periodo_id]
        );

        return {
            resumen: data,
            movimientos: movimientos
        };
    }

    /**
     * Calcula el impuesto sobre la renta progresivo (Basado en tramos CR 2024/2025)
     */
    calcularImpuestoRenta(salarioBruto) {
        let impuesto = 0;
        const monto = parseFloat(salarioBruto);

        // Tramos Mensuales
        const t1 = 929000;
        const t2 = 1363000;
        const t3 = 2392000;
        const t4 = 4783000;

        if (monto <= t1) return 0;

        // Tramo 10%
        if (monto > t1) {
            const base = Math.min(monto, t2) - t1;
            impuesto += base * 0.10;
        }

        // Tramo 15%
        if (monto > t2) {
            const base = Math.min(monto, t3) - t2;
            impuesto += base * 0.15;
        }

        // Tramo 20%
        if (monto > t3) {
            const base = Math.min(monto, t4) - t3;
            impuesto += base * 0.20;
        }

        // Tramo 25%
        if (monto > t4) {
            const base = monto - t4;
            impuesto += base * 0.25;
        }

        return impuesto;
    }
}

module.exports = new PlanillaMotor();
