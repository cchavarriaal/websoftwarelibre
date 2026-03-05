const { ejecutarConsulta } = require('../db.js');


class Conceptos {

  constructor() { }; 
  
  async conceptoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`conceptos` ORDER BY nombre ASC");
  }
  async conceptoscrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`conceptos` (nombre, tipo, porcentaje) VALUES (?,?,?,?)", [d.nombre, d.tipo, d.porcentaje]);
  }
  async conceptosactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`conceptos` SET nombre=?, tipo=?, porcentaje=? WHERE id=?", [d.nombre, d.tipo, d.porcentaje, id]);
  }
  async conceptoseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`conceptos` WHERE id=?", [id]);
  }

    };


module.exports = new Conceptos();