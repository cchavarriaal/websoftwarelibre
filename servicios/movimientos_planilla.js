const { ejecutarConsulta } = require('../db.js');

class MovimientosPlanilla {
    constructor() { }

    async movimientos_planillalistar() {
        return await ejecutarConsulta(`
            SELECT m.*, CONCAT(e.nombre, ' ', e.apellido) AS empleado_nombre, p.nombre_periodo AS periodo_nombre, c.nombre AS concepto_nombre 
            FROM planillasweb.movimientos_planilla m 
            LEFT JOIN planillasweb.empleados e ON m.empleado_id = e.id 
            LEFT JOIN planillasweb.periodos_planilla p ON m.periodo_id = p.id 
            LEFT JOIN planillasweb.conceptos c ON m.concepto_id = c.id 
            ORDER BY m.id DESC
        `);
    }
    async movimientos_planillacrear(d) {
        const result = await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`movimientos_planilla` (empleado_id, periodo_id, concepto_id, monto_calculado) VALUES (?,?,?,?)",
            [d.empleado_id, d.periodo_id, d.concepto_id, d.monto_calculado]
        );
        if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'movimientos_planilla', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
        return result;
    }
    async movimientos_planillaactualizar(id, d) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`movimientos_planilla` WHERE id=?", [id]);
        const result = await ejecutarConsulta(
            "UPDATE `planillasweb`.`movimientos_planilla` SET empleado_id=?, periodo_id=?, concepto_id=?, monto_calculado=? WHERE id=?",
            [d.empleado_id, d.periodo_id, d.concepto_id, d.monto_calculado, id]
        );
        if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'movimientos_planilla', id, 'UPDATE', JSON.stringify(filas[0] || null), JSON.stringify(d)]); }
        return result;
    }
    async movimientos_planillaeliminar(id) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`movimientos_planilla` WHERE id=?", [id]);
        const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`movimientos_planilla` WHERE id=?", [id]);
        if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'movimientos_planilla', id, 'DELETE', JSON.stringify(filas[0] || null), null]); }
        return result;
    }

    async movimientos_planillabuscarPorDniEmpleado(dni) {
        return await ejecutarConsulta(
            "SELECT mp.*, e.nombre as empleado_nombre, c.nombre as concepto_nombre " +
            "FROM `planillasweb`.`movimientos_planilla` mp " +
            "JOIN `planillasweb`.`empleados` e ON mp.empleado_id = e.id " +
            "JOIN `planillasweb`.`conceptos` c ON mp.concepto_id = c.id " +
            "WHERE e.dni LIKE ? " +
            "ORDER BY mp.id DESC",
            [`%${dni}%`]
        );
    }
}

module.exports = new MovimientosPlanilla();
