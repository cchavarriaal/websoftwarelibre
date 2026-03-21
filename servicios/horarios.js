const { ejecutarConsulta } = require('../db.js');

class Horarios {
  constructor() { }

  async horarioslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`horarios` ORDER BY nombre ASC");
  }
  async horarioscrear(d) {
    return await ejecutarConsulta(
      "INSERT INTO `planillasweb`.`horarios` (nombre, hora_entrada, hora_salida, dias_laborables) VALUES (?,?,?,?)",
      [d.nombre, d.hora_entrada, d.hora_salida, d.dias_laborables]
    );
  }
  async horariosactualizar(id, d) {
    return await ejecutarConsulta(
      "UPDATE `planillasweb`.`horarios` SET nombre=?, hora_entrada=?, hora_salida=?, dias_laborables=? WHERE id=?",
      [d.nombre, d.hora_entrada, d.hora_salida, d.dias_laborables, id]
    );
  }
  async horarioseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`horarios` WHERE id=?", [id]);
  }
}

module.exports = new Horarios();
