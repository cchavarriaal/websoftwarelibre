const { ejecutarConsulta } = require('../db.js');

class Empleados {

  constructor() { };
  
  // ==========================================
  // SUBGRUPO 2: GESTIÓN DE PERSONAL
  // ==========================================

  // --- EMPLEADOS ---

    async empleadoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`empleados`");
  }
  async empleadoscrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`empleados` (codigo_empleado, nombre, apellido, dni, fecha_ingreso, salario_base, puesto_id) VALUES (?,?,?,?,?,?,?)", [d.codigo_empleado, d.nombre, d.apellido, d.dni, d.fecha_ingreso, d.salario_base, d.puesto_id]);
  }
  async empleadosactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`empleados` SET nombre=?, apellido=?, salario_base=?, puesto_id=? WHERE id=?", [d.nombre, d.apellido, d.salario_base, d.puesto_id, id]);
  }
  async empleadoseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`empleados` WHERE id=?", [id]);
  }

  };


module.exports = new Empleados();