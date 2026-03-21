const express = require('express');
const Router = express.Router();

const Horarios = require('../servicios/horarios.js');

// Horarios routes
Router.get('/horarioslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Horarios.horarioslistar());
});
Router.post('/horarioscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Horarios.horarioscrear(solicitud.body));
});
Router.put('/horariosactualizar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Horarios.horariosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/horarioseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Horarios.horarioseliminar(solicitud.params.id));
});

module.exports = Router;
