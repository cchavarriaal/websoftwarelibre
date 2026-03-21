const { ejecutarConsulta } = require('../db.js');

class Empleados {
  constructor() { }

  async empleadoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`empleados` ORDER BY apellido ASC, nombre ASC");
  }
  async empleadoscrear(d) {
    const result = await ejecutarConsulta(
      "INSERT INTO `planillasweb`.`empleados` (codigo_empleado, nombre, apellido, dni, fecha_ingreso, salario_base, puesto_id, horario_id) VALUES (?,?,?,?,?,?,?,?)",
      [d.codigo_empleado, d.nombre, d.apellido, d.dni, d.fecha_ingreso, d.salario_base, d.puesto_id, d.horario_id]
    );
    if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'empleados', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
    return result;
  }
  async empleadosactualizar(id, d) {
    const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`empleados` WHERE id=?", [id]);
    const result = await ejecutarConsulta(
      "UPDATE `planillasweb`.`empleados` SET codigo_empleado=?, nombre=?, apellido=?, dni=?, fecha_ingreso=?, salario_base=?, puesto_id=?, horario_id=? WHERE id=?",
      [d.codigo_empleado, d.nombre, d.apellido, d.dni, d.fecha_ingreso, d.salario_base, d.puesto_id, d.horario_id, id]
    );
    if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'empleados', id, 'UPDATE', JSON.stringify(filas[0] || null), JSON.stringify(d)]); }
    return result;
  }
  async empleadoseliminar(id) {
    const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`empleados` WHERE id=?", [id]);
    const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`empleados` WHERE id=?", [id]);
    if (result && result.affectedRows > 0) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [null, 'empleados', id, 'DELETE', JSON.stringify(filas[0] || null), null]); }
    return result;
  }
}

module.exports = new Empleados();