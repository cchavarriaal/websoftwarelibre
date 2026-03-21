const { ejecutarConsulta } = require('../db.js');


class Conceptos {

  constructor() { }; 
  
  async conceptoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`conceptos` ORDER BY nombre ASC");
  }
  async conceptoscrear(d) {
    const result = await ejecutarConsulta("INSERT INTO `planillasweb`.`conceptos` (nombre, tipo, es_ley) VALUES (?, ?, ?)", [d.nombre, d.tipo, d.es_ley]);
    if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'conceptos', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
    return result;
  }
  async conceptosactualizar(id, d) {
    const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`conceptos` WHERE id=?", [id]);
    const valor_anterior = filas.length > 0 ? filas[0] : null;
    const result = await ejecutarConsulta("UPDATE `planillasweb`.`conceptos` SET nombre=?, tipo=?, es_ley=? WHERE id=?", [d.nombre, d.tipo, d.es_ley, id]);
    if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'conceptos', id, 'UPDATE', JSON.stringify(valor_anterior), JSON.stringify(d)]); }
    return result;
  }
  async conceptoseliminar(id) {
    const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`conceptos` WHERE id=?", [id]);
    const valor_anterior = filas.length > 0 ? filas[0] : null;
    const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`conceptos` WHERE id=?", [id]);
    if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'conceptos', id, 'DELETE', JSON.stringify(valor_anterior), null]); }
    return result;
  }

    };


module.exports = new Conceptos();