const express = require('express');
const Router = express.Router();

const Puestos = require('../servicios/puestos.js');

// Puestos routes
Router.get('/puestoslistar', async (solicitud, respuesta, next) => {
    return respuesta.json(await Puestos.puestoslistar());
});
Router.post('/puestoscrear', async (solicitud, respuesta, next) => {
    return respuesta.json(await Puestos.puestoscrear(solicitud.body));
});
Router.put('/puestosactualizar/:id', async (solicitud, respuesta, next) => {
    return respuesta.json(await Puestos.puestosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/puestoseliminar/:id', async (solicitud, respuesta, next) => {
    return respuesta.json(await Puestos.puestoseliminar(solicitud.params.id));
});

module.exports = Router;
