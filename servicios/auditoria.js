const { ejecutarConsulta } = require('../db.js');

class Auditoria {
  constructor() { }

  async auditorialistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`auditoria` ORDER BY fecha_hora DESC");
  }
  async auditoriacrear(d) {
    return await ejecutarConsulta(
      "INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)",
      [d.usuario_id, d.tabla_afectada, d.registro_id, d.accion, JSON.stringify(d.valor_anterior), JSON.stringify(d.valor_nuevo)]
    );
  }
}

module.exports = new Auditoria();