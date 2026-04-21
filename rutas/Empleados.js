const express = require('express');
const Router = express.Router();

const Empleados = require('../servicios/empleados.js');

// Empleados routes
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
Router.get('/siguientecodigo', async (solicitud, respuesta, next) => {
  return respuesta.json(await Empleados.siguientecodigo());
});

module.exports = Router;