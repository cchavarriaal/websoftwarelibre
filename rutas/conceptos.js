const express = require('express');
const Router = express.Router();

const Concepto = require('../servicios/concepto.js');

// Conceptos routes
Router.get('/conceptoslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Concepto.conceptoslistar());
});
Router.post('/conceptoscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Concepto.conceptoscrear(solicitud.body));
});
Router.put('/conceptosactualizar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Concepto.conceptosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/conceptoseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Concepto.conceptoseliminar(solicitud.params.id));
});

module.exports = Router;
