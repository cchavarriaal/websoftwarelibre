const { ejecutarConsulta } = require('../db.js');

class Servicio1 {

  constructor() { };

  async listar(Datos) {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios` WHERE `username` = ?"
      , [Datos.Usuario]);
  }

  // ==========================================
  // SUBGRUPO 1: LECTURAS (GET ALL)
  // ==========================================

  async usuarioslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios`");
  }
  async auditorialistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`auditoria` ORDER BY fecha_hora DESC");
  }
  async conceptoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`conceptos`");
  }
  async departamentoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`departamentos`");
  }

  async movimientos_planillalistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`movimientos_planilla`");
  }
  async periodos_planillalistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`periodos_planilla` ORDER BY fecha_inicio DESC");
  }
  async puestoslistar() {
    return await ejecutarConsulta("SELECT * FROM `planillasweb`.`puestos`");
  }

  // ==========================================
  // SUBGRUPO 2: GESTIÓN DE PERSONAL
  // ==========================================

  
  // --- DEPARTAMENTOS ---
  async departamentoscrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`departamentos` (nombre) VALUES (?)", [d.nombre]);
  }
  async departamentosactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`departamentos` SET nombre=? WHERE id=?", [d.nombre, id]);
  }
  async departamentoseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`departamentos` WHERE id=?", [id]);
  }

  // --- PUESTOS ---
  async puestoscrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`puestos` (nombre, salario_base_sugerido, departamento_id) VALUES (?,?,?)", [d.nombre, d.salario_base_sugerido, d.departamento_id]);
  }
  async puestosactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`puestos` SET nombre=?, salario_base_sugerido=?, departamento_id=? WHERE id=?", [d.nombre, d.salario_base_sugerido, d.departamento_id, id]);
  }
  async puestoseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`puestos` WHERE id=?", [id]);
  }

  // ==========================================
  // SUBGRUPO 3: OPERACIONES DE PLANILLA
  // ==========================================

  // --- MOVIMIENTOS ---
  async movimientos_planillacrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`movimientos_planilla` (empleado_id, periodo_id, concepto_id, monto_calculado) VALUES (?,?,?,?)", [d.empleado_id, d.periodo_id, d.concepto_id, d.monto_calculado]);
  }
  async movimientos_planillaeliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`movimientos_planilla` WHERE id=?", [id]);
  }

  // --- PERIODOS ---
  async periodos_planillacrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`periodos_planilla` (nombre_periodo, fecha_inicio, fecha_fin, estado) VALUES (?,?,?,?)", [d.nombre_periodo, d.fecha_inicio, d.fecha_fin, d.estado]);
  }
  async periodos_planillaactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`periodos_planilla` SET nombre_periodo=?, fecha_inicio=?, fecha_fin=?, estado=? WHERE id=?", [d.nombre_periodo, d.fecha_inicio, d.fecha_fin, d.estado, id]);
  }

  // --- CONCEPTOS ---
  async conceptoscrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`conceptos` (nombre, tipo, es_ley) VALUES (?,?,?)", [d.nombre, d.tipo, d.es_ley]);
  }
  async conceptosactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`conceptos` SET nombre=?, tipo=?, es_ley=? WHERE id=?", [d.nombre, d.tipo, d.es_ley, id]);
  }
  async conceptoseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`conceptos` WHERE id=?", [id]);
  }

  // ==========================================
  // SUBGRUPO 4: SEGURIDAD Y USUARIOS
  // ==========================================

  async usuarioscrear(d) {
    return await ejecutarConsulta("INSERT INTO `planillasweb`.`usuarios` (username, password_hash, rol, empleado_id, pregunta_seguridad, respuesta_seguridad, estado) VALUES (?,?,?,?,?,?,?)", [d.username, d.password_hash, d.rol, d.empleado_id, d.pregunta_seguridad, d.respuesta_seguridad, d.estado]);
  }
  async usuariosactualizar(id, d) {
    return await ejecutarConsulta("UPDATE `planillasweb`.`usuarios` SET username=?, rol=?, estado=?, pregunta_seguridad=?, respuesta_seguridad=? WHERE id=?", [d.username, d.rol, d.estado, d.pregunta_seguridad, d.respuesta_seguridad, id]);
  }
  async usuarioseliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`usuarios` WHERE id=?", [id]);
  }

  // ==========================================
  // SUBGRUPO 5: AUDITORÍA
  // ==========================================

  async auditoriaeliminar(id) {
    return await ejecutarConsulta("DELETE FROM `planillasweb`.`auditoria` WHERE id=?", [id]);
  }

};


module.exports = new Servicio1();
