const { ejecutarConsulta } = require('../db.js');

class Departamentos {
    constructor() { }

    async departamentoslistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`departamentos` ORDER BY nombre ASC");
    }
    async departamentoscrear(d) {
        return await ejecutarConsulta("INSERT INTO `planillasweb`.`departamentos` (nombre) VALUES (?)", [d.nombre]);
    }
    async departamentosactualizar(id, d) {
        return await ejecutarConsulta("UPDATE `planillasweb`.`departamentos` SET nombre=? WHERE id=?", [d.nombre, id]);
    }
    async departamentoseliminar(id) {
        return await ejecutarConsulta("DELETE FROM `planillasweb`.`departamentos` WHERE id=?", [id]);
    }
}

module.exports = new Departamentos();
