const { ejecutarConsulta } = require('../db.js');

class Empleados {
  constructor() { }

  async empleadoslistar() {
    return await ejecutarConsulta(`
      SELECT e.*, p.nombre AS puesto_nombre, h.nombre AS horario_nombre 
      FROM planillasweb.empleados e 
      LEFT JOIN planillasweb.puestos p ON e.puesto_id = p.id 
      LEFT JOIN planillasweb.horarios h ON e.horario_id = h.id 
      ORDER BY e.apellido ASC, e.nombre ASC
    `);
  }
  async empleadoscrear(d) {
    const result = await ejecutarConsulta(
      "INSERT INTO `planillasweb`.`empleados` (codigo_empleado, nombre, apellido, dni, fecha_ingreso, salario_base, puesto_id, horario_id, cuenta_iban, banco) VALUES (?,?,?,?,?,?,?,?,?,?)",
      ['', d.nombre, d.apellido, d.dni, d.fecha_ingreso, d.salario_base, d.puesto_id, d.horario_id, d.cuenta_iban || null, d.banco || null]
    );
    if (result && result.insertId) { await ejecutarConsulta("INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)", [d.usuario_accion_id || null, 'empleados', result.insertId, 'INSERT', null, JSON.stringify(d)]); }
    return result;
  }
  async empleadosactualizar(id, d) {
    const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`empleados` WHERE id=?", [id]);
    const result = await ejecutarConsulta(
      "UPDATE `planillasweb`.`empleados` SET codigo_empleado=?, nombre=?, apellido=?, dni=?, fecha_ingreso=?, salario_base=?, puesto_id=?, horario_id=?, cuenta_iban=?, banco=? WHERE id=?",
      [d.codigo_empleado, d.nombre, d.apellido, d.dni, d.fecha_ingreso, d.salario_base, d.puesto_id, d.horario_id, d.cuenta_iban || null, d.banco || null, id]
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

  async empleadosbuscarPorDni(dni) {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`empleados` WHERE dni LIKE ?", [`%${dni}%`]);
  }
}

module.exports = new Empleados();