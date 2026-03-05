const { ejecutarConsulta } = require('../db.js');

class Puestos {
    constructor() { }

    async puestoslistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`puestos` ORDER BY nombre ASC");
    }
    async puestoscrear(d) {
        return await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`puestos` (nombre, salario_base_sugerido, departamento_id) VALUES (?,?,?)",
            [d.nombre, d.salario_base_sugerido, d.departamento_id]
        );
    }
    async puestosactualizar(id, d) {
        return await ejecutarConsulta(
            "UPDATE `planillasweb`.`puestos` SET nombre=?, salario_base_sugerido=?, departamento_id=? WHERE id=?",
            [d.nombre, d.salario_base_sugerido, d.departamento_id, id]
        );
    }
    async puestoseliminar(id) {
        return await ejecutarConsulta("DELETE FROM `planillasweb`.`puestos` WHERE id=?", [id]);
    }
}

module.exports = new Puestos();
