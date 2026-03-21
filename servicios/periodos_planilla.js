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
        if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'periodos_planilla', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
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
        const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`periodos_planilla` WHERE id=?", [id]);
        if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'periodos_planilla', id, 'DELETE', JSON.stringify(filas[0] || null), null]); }
        return result;
    }
}

module.exports = new PeriodosPlanilla();
