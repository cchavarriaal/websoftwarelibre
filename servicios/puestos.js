const { ejecutarConsulta } = require('../db.js');

class Puestos {
    constructor() { }

    async puestoslistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`puestos` ORDER BY nombre ASC");
    }
    async puestoscrear(d) {
        const result = await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`puestos` (nombre, salario_base_sugerido, departamento_id) VALUES (?,?,?)",
            [d.nombre, d.salario_base_sugerido, d.departamento_id]
        );
        if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'puestos', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
        return result;
    }
    async puestosactualizar(id, d) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`puestos` WHERE id=?", [id]);
        const result = await ejecutarConsulta(
            "UPDATE `planillasweb`.`puestos` SET nombre=?, salario_base_sugerido=?, departamento_id=? WHERE id=?",
            [d.nombre, d.salario_base_sugerido, d.departamento_id, id]
        );
        if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'puestos', id, 'UPDATE', JSON.stringify(filas[0] || null), JSON.stringify(d)]); }
        return result;
    }
    async puestoseliminar(id) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`puestos` WHERE id=?", [id]);
        const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`puestos` WHERE id=?", [id]);
        if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'puestos', id, 'DELETE', JSON.stringify(filas[0] || null), null]); }
        return result;
    }
}

module.exports = new Puestos();
