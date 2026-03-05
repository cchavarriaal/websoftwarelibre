const express = require('express');
const Router = express.Router();

const Departamentos = require('../servicios/departamentos.js');

// Departamentos routes
Router.get('/departamentoslistar', async (solicitud, respuesta, next) => {
    return respuesta.json(await Departamentos.departamentoslistar());
});
Router.post('/departamentoscrear', async (solicitud, respuesta, next) => {
    return respuesta.json(await Departamentos.departamentoscrear(solicitud.body));
});
Router.put('/departamentosactualizar/:id', async (solicitud, respuesta, next) => {
    return respuesta.json(await Departamentos.departamentosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/departamentoseliminar/:id', async (solicitud, respuesta, next) => {
    return respuesta.json(await Departamentos.departamentoseliminar(solicitud.params.id));
});

module.exports = Router;
