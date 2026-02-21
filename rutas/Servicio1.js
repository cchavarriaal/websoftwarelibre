const express = require('express');
const Router = express.Router();

const Servicio1 = require('../servicios/Servicio1.js');

Router.post('/listar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.listar(solicitud.body));
});
// ==========================================
// SUBGRUPO: PERSONAL Y ESTRUCTURA
// ==========================================

// Departamentos
Router.get('/departamentoslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.departamentoslistar());
});
Router.post('/departamentoscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.departamentoscrear(solicitud.body));
});
Router.put('/departamentosactualizar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.departamentosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/departamentoseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.departamentoseliminar(solicitud.params.id));
});

// Puestos
Router.get('/puestoslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.puestoslistar());
});
Router.post('/puestoscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.puestoscrear(solicitud.body));
});
Router.put('/puestosactualizar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.puestosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/puestoseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.puestoseliminar(solicitud.params.id));
});

// ==========================================
// SUBGRUPO: MOVIMIENTOS Y PERIODOS
// ==========================================

// Movimientos
Router.get('/movimientos_planillalistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.movimientos_planillalistar());
});
Router.post('/movimientos_planillacrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.movimientos_planillacrear(solicitud.body));
});
Router.delete('/movimientos_planillaeliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.movimientos_planillaeliminar(solicitud.params.id));
});

// Periodos
Router.get('/periodos_planillalistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.periodos_planillalistar());
});
Router.post('/periodos_planillacrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.periodos_planillacrear(solicitud.body));
});

// Conceptos
Router.get('/conceptoslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.conceptoslistar());
});
Router.post('/conceptoscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.conceptoscrear(solicitud.body));
});
Router.delete('/conceptoseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.conceptoseliminar(solicitud.params.id));
});

// ==========================================
// SUBGRUPO: SEGURIDAD Y AUDITORÍA
// ==========================================

// Usuarios
Router.get('/usuarioslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.usuarioslistar());
});
Router.post('/usuarioscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.usuarioscrear(solicitud.body));
});
Router.put('/usuariosactualizar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.usuariosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/usuarioseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.usuarioseliminar(solicitud.params.id));
});

// Auditoría
Router.get('/auditorialistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Servicio1.auditorialistar());
});

module.exports = Router;
