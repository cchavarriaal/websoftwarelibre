const { ejecutarConsulta } = require('../db.js');

class Horarios {
  constructor() { }

  async horarioslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`horarios` ORDER BY nombre ASC");
  }
  async horarioscrear(d) {
    const result = await ejecutarConsulta(
      "INSERT INTO `planillasweb`.`horarios` (nombre, hora_entrada, hora_salida, dias_laborables) VALUES (?,?,?,?)",
      [d.nombre, d.hora_entrada, d.hora_salida, d.dias_laborables]
    );
    if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'horarios', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
    return result;
  }
  async horariosactualizar(id, d) {
    const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`horarios` WHERE id=?", [id]);
    const result = await ejecutarConsulta(
      "UPDATE `planillasweb`.`horarios` SET nombre=?, hora_entrada=?, hora_salida=?, dias_laborables=? WHERE id=?",
      [d.nombre, d.hora_entrada, d.hora_salida, d.dias_laborables, id]
    );
    if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'horarios', id, 'UPDATE', JSON.stringify(filas[0] || null), JSON.stringify(d)]); }
    return result;
  }
  async horarioseliminar(id) {
    const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`horarios` WHERE id=?", [id]);
    const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`horarios` WHERE id=?", [id]);
    if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'horarios', id, 'DELETE', JSON.stringify(filas[0] || null), null]); }
    return result;
  }
}

module.exports = new Horarios();
