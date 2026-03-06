const { ejecutarConsulta } = require('../db.js');


class Conceptos {

  constructor() { }; 
  
  async conceptoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`conceptos` ORDER BY nombre ASC");
  }
  async conceptoscrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`conceptos` (nombre, tipo, es_ley) VALUES (?, ?, ?)", [d.nombre, d.tipo, d.es_ley]);
  }
  async conceptosactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`conceptos` SET nombre=?, tipo=?, es_ley=? WHERE id=?", [d.nombre, d.tipo, d.es_ley, id]);
  }
  async conceptoseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`conceptos` WHERE id=?", [id]);
  }

    };


module.exports = new Conceptos();