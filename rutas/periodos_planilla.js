const express = require('express');
const Router = express.Router();

const PeriodosPlanilla = require('../servicios/periodos_planilla.js');

// Periodos Planilla routes
Router.get('/periodos_planillalistar', async (solicitud, respuesta, next) => {
    return respuesta.json(await PeriodosPlanilla.periodos_planillalistar());
});
Router.post('/periodos_planillacrear', async (solicitud, respuesta, next) => {
    return respuesta.json(await PeriodosPlanilla.periodos_planillacrear(solicitud.body));
});
Router.put('/periodos_planillaactualizar/:id', async (solicitud, respuesta, next) => {
    return respuesta.json(await PeriodosPlanilla.periodos_planillaactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/periodos_planillaeliminar/:id', async (solicitud, respuesta, next) => {
    try {
        return respuesta.json(await PeriodosPlanilla.periodos_planillaeliminar(solicitud.params.id));
    } catch (error) {
        return respuesta.status(500).json({ error: error.message });
    }
});

module.exports = Router;
