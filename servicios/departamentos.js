const { ejecutarConsulta } = require('../db.js');

class Departamentos {
    constructor() { }

    async departamentoslistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`departamentos` ORDER BY nombre ASC");
    }
  async departamentoscrear(d) {
      const result = await ejecutarConsulta("INSERT INTO `planillasweb`.`departamentos` (nombre) VALUES (?)", [d.nombre]);
      if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'departamentos', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
      return result;
  }
  async departamentosactualizar(id, d) {
      const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`departamentos` WHERE id=?", [id]);
      const valor_anterior = filas.length > 0 ? filas[0] : null;
      const result = await ejecutarConsulta("UPDATE `planillasweb`.`departamentos` SET nombre=? WHERE id=?", [d.nombre, id]);
      if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'departamentos', id, 'UPDATE', JSON.stringify(valor_anterior), JSON.stringify(d)]); }
      return result;
  }
  async departamentoseliminar(id) {
      const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`departamentos` WHERE id=?", [id]);
      const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`departamentos` WHERE id=?", [id]);
      if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'departamentos', id, 'DELETE', JSON.stringify(filas[0] || null), null]); }
      return result;
  }

  
  async departamentosbuscarPorNombre(nombre) {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`departamentos` WHERE nombre LIKE ?", [`%${nombre}%`]);
  }
}

module.exports = new Departamentos();
