const { ejecutarConsulta } = require('../db.js');

class PeriodosPlanilla {
    constructor() { }

    async periodos_planillalistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`periodos_planilla` ORDER BY fecha_inicio DESC");
    }
    async periodos_planillacrear(d) {
        return await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`periodos_planilla` (nombre_periodo, fecha_inicio, fecha_fin, estado) VALUES (?,?,?,?)",
            [d.nombre_periodo, d.fecha_inicio, d.fecha_fin, d.estado]
        );
    }
    async periodos_planillaactualizar(id, d) {
        return await ejecutarConsulta(
            "UPDATE `planillasweb`.`periodos_planilla` SET nombre_periodo=?, fecha_inicio=?, fecha_fin=?, estado=? WHERE id=?",
            [d.nombre_periodo, d.fecha_inicio, d.fecha_fin, d.estado, id]
        );
    }
    async periodos_planillaeliminar(id) {
        return await ejecutarConsulta("DELETE FROM `planillasweb`.`periodos_planilla` WHERE id=?", [id]);
    }
}

module.exports = new PeriodosPlanilla();
