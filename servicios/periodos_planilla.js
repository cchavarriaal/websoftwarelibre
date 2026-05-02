const { ejecutarConsulta } = require('../db.js');

class PeriodosPlanilla {
    constructor() { }

    async periodos_planillalistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`periodos_planilla` ORDER BY fecha_inicio DESC");
    }
    async periodos_planillacrear(d) {
        const result = await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`periodos_planilla` (nombre_periodo, fecha_inicio, fecha_fin, estado) VALUES (?,?,?,?)",
            [d.nombre_periodo, d.fecha_inicio, d.fecha_fin, d.estado]
        );
        
        if (result && result.insertId) {
            const periodoId = result.insertId;

            // --- AUTOMATIZACIÓN: Insertar CCSS (Concepto ID 1) para todos los empleados activos ---
            // Buscamos el porcentaje actual de la CCSS
            const conceptoCCSS = await ejecutarConsulta("SELECT id, porcentaje FROM conceptos WHERE id = 1 OR nombre LIKE '%CCSS%' LIMIT 1");
            
            if (conceptoCCSS && conceptoCCSS.length > 0) {
                const { id: conceptoId, porcentaje } = conceptoCCSS[0];
                const empleados = await ejecutarConsulta("SELECT id, salario_base FROM empleados WHERE estado = 1");

                for (const emp of empleados) {
                    const montoCCSS = parseFloat(emp.salario_base) * (parseFloat(porcentaje) / 100);
                    await ejecutarConsulta(
                        "INSERT INTO movimientos_planilla (empleado_id, periodo_id, concepto_id, monto_calculado) VALUES (?, ?, ?, ?)",
                        [emp.id, periodoId, conceptoId, montoCCSS]
                    );
                }
            }

            // Auditoría
            await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'periodos_planilla', periodoId, 'INSERT', null, JSON.stringify(d)]);
        }
        return result;
    }
    async periodos_planillaactualizar(id, d) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`periodos_planilla` WHERE id=?", [id]);
        const result = await ejecutarConsulta(
            "UPDATE `planillasweb`.`periodos_planilla` SET nombre_periodo=?, fecha_inicio=?, fecha_fin=?, estado=? WHERE id=?",
            [d.nombre_periodo, d.fecha_inicio, d.fecha_fin, d.estado, id]
        );
        if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'periodos_planilla', id, 'UPDATE', JSON.stringify(filas[0] || null), JSON.stringify(d)]); }
        return result;
    }
    async periodos_planillaeliminar(id) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`periodos_planilla` WHERE id=?", [id]);
        
        // Eliminar dependencias primero para evitar error de llave foránea
        await ejecutarConsulta("DELETE FROM `planillasweb`.`planilla_calculada` WHERE periodo_id=?", [id]);
        await ejecutarConsulta("DELETE FROM `planillasweb`.`movimientos_planilla` WHERE periodo_id=?", [id]);
        
        const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`periodos_planilla` WHERE id=?", [id]);
        
        if (result && result.affectedRows > 0) { 
            await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'periodos_planilla', id, 'DELETE', JSON.stringify(filas[0] || null), null]); 
            return { success: true, message: "Periodo eliminado correctamente" };
        } else {
            throw new Error("No se pudo eliminar el periodo debido a un error en la base de datos o restricciones adicionales.");
        }
    }
}

module.exports = new PeriodosPlanilla();
