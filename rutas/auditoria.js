const express = require('express');
const Router = express.Router();

const Auditoria = require('../servicios/auditoria.js');

// Auditoría routes
Router.get('/auditorialistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Auditoria.auditorialistar());
});
Router.post('/auditoriacrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Auditoria.auditoriacrear(solicitud.body));
});

module.exports = Router;