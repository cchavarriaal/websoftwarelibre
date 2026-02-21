const express = require('express');
const Router = express.Router();

const Empleados = require('../servicios/Empleados.js');

Router.post('/listar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Empleados.listar(solicitud.body));
});
// ==========================================
// SUBGRUPO: PERSONAL Y ESTRUCTURA
// ==========================================

// Empleados
Router.get('/empleadoslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Empleados.empleadoslistar());
});
Router.post('/empleadoscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Empleados.empleadoscrear(solicitud.body));
});
Router.put('/empleadosactualizar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Empleados.empleadosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/empleadoseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Empleados.empleadoseliminar(solicitud.params.id));
});

module.exports = Router;