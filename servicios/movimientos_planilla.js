const { ejecutarConsulta } = require('../db.js');

class MovimientosPlanilla {
    constructor() { }

    async movimientos_planillalistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`movimientos_planilla` ORDER BY id DESC");
    }
    async movimientos_planillacrear(d) {
        return await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`movimientos_planilla` (empleado_id, periodo_id, concepto_id, monto_calculado) VALUES (?,?,?,?)",
            [d.empleado_id, d.periodo_id, d.concepto_id, d.monto_calculado]
        );
    }
    async movimientos_planillaactualizar(id, d) {
        return await ejecutarConsulta(
            "UPDATE `planillasweb`.`movimientos_planilla` SET empleado_id=?, periodo_id=?, concepto_id=?, monto_calculado=? WHERE id=?",
            [d.empleado_id, d.periodo_id, d.concepto_id, d.monto_calculado, id]
        );
    }
    async movimientos_planillaeliminar(id) {
        return await ejecutarConsulta("DELETE FROM `planillasweb`.`movimientos_planilla` WHERE id=?", [id]);
    }
}

module.exports = new MovimientosPlanilla();
