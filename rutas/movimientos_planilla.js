const express = require('express');
const Router = express.Router();

const MovimientosPlanilla = require('../servicios/movimientos_planilla.js');

// Movimientos Planilla routes
Router.get('/movimientos_planillalistar', async (solicitud, respuesta, next) => {
    return respuesta.json(await MovimientosPlanilla.movimientos_planillalistar());
});
Router.post('/movimientos_planillacrear', async (solicitud, respuesta, next) => {
    return respuesta.json(await MovimientosPlanilla.movimientos_planillacrear(solicitud.body));
});
Router.put('/movimientos_planillaactualizar/:id', async (solicitud, respuesta, next) => {
    return respuesta.json(await MovimientosPlanilla.movimientos_planillaactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/movimientos_planillaeliminar/:id', async (solicitud, respuesta, next) => {
    return respuesta.json(await MovimientosPlanilla.movimientos_planillaeliminar(solicitud.params.id));
});

module.exports = Router;
