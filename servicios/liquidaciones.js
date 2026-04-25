const { ejecutarConsulta } = require('../db.js');

class LiquidacionesService {
    constructor() { }

    /**
     * Calcula una liquidación sugerida para un empleado
     * @param {number} empleadoId 
     * @param {string} fechaSalida 
     * @param {string} motivo 'Renuncia', 'Despido con responsabilidad', 'Despido sin responsabilidad'
     */
    async calcularLiquidacion(empleadoId, fechaSalida, motivo) {
        // 1. Obtener datos del empleado
        const empRows = await ejecutarConsulta(
            "SELECT *, DATEDIFF(?, fecha_ingreso) as dias_laborados FROM empleados WHERE id = ?",
            [fechaSalida, empleadoId]
        );
        
        if (!empRows || empRows.length === 0) throw new Error("Empleado no encontrado");
        const emp = empRows[0];
        const salarioBase = parseFloat(emp.salario_base);
        const salarioDiario = salarioBase / 30;
        const añosLaborados = emp.dias_laborados / 365;

        // 2. Calcular Aguinaldo Proporcional (Simplificado: desde el 1 de dic del año anterior)
        // Buscamos el acumulado en la tabla que ya tenemos
        const acumulados = await ejecutarConsulta(
            "SELECT SUM(aguinaldo_acumulado) as total_aguinaldo, SUM(vacaciones_acumuladas) as total_vacas FROM acumulados_empleado WHERE empleado_id = ? AND anio = YEAR(?)",
            [empleadoId, fechaSalida]
        );
        
        const montoAguinaldo = acumulados[0]?.total_aguinaldo || 0;
        const diasVacas = acumulados[0]?.total_vacas || 0;
        const montoVacas = diasVacas * salarioDiario;

        let montoPreaviso = 0;
        let montoCesantia = 0;

        // 3. Si hay responsabilidad patronal, calculamos Preaviso y Cesantía
        if (motivo === 'Despido con responsabilidad') {
            // Preaviso
            if (emp.dias_laborados >= 90 && emp.dias_laborados < 180) montoPreaviso = salarioDiario * 7;
            else if (emp.dias_laborados >= 180 && emp.dias_laborados < 365) montoPreaviso = salarioDiario * 15;
            else if (emp.dias_laborados >= 365) montoPreaviso = salarioDiario * 30;

            // Cesantía (Simplificado: 20 días por año)
            if (emp.dias_laborados >= 90) {
                montoCesantia = Math.min(salarioDiario * 20 * añosLaborados, salarioBase * 8); // Tope de 8 años aprox
            }
        }

        const total = parseFloat(montoAguinaldo) + parseFloat(montoVacas) + parseFloat(montoPreaviso) + parseFloat(montoCesantia);

        return {
            empleado: `${emp.nombre} ${emp.apellido}`,
            salario_base: salarioBase,
            antiguedad_dias: emp.dias_laborados,
            detalle: {
                aguinaldo: montoAguinaldo,
                vacaciones: montoVacas,
                preaviso: montoPreaviso,
                cesantia: montoCesantia
            },
            total: total
        };
    }

    async guardarLiquidacion(datos) {
        return await ejecutarConsulta(
            `INSERT INTO liquidaciones 
            (empleado_id, fecha_salida, motivo, monto_aguinaldo, monto_vacaciones, monto_preaviso, monto_cesantia, total_liquidacion)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)`,
            [
                datos.empleado_id, datos.fecha_salida, datos.motivo, 
                datos.monto_aguinaldo, datos.monto_vacaciones, 
                datos.monto_preaviso, datos.monto_cesantia, datos.total_liquidacion
            ]
        );
    }

    async listarLiquidaciones() {
        return await ejecutarConsulta(`
            SELECT l.*, e.nombre, e.apellido, e.codigo_empleado 
            FROM liquidaciones l
            JOIN empleados e ON l.empleado_id = e.id
            ORDER BY l.fecha_creacion DESC
        `);
    }
}

module.exports = new LiquidacionesService();
