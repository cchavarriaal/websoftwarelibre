const express = require('express');
const Router = express.Router();
const Liquidaciones = require('../servicios/liquidaciones.js');

Router.post('/calcular', async (solicitud, respuesta) => {
    try {
        const { empleado_id, fecha_salida, motivo } = solicitud.body;
        const resultado = await Liquidaciones.calcularLiquidacion(empleado_id, fecha_salida, motivo);
        respuesta.json(resultado);
    } catch (error) {
        respuesta.status(500).json({ error: error.message });
    }
});

Router.post('/guardar', async (solicitud, respuesta) => {
    try {
        const resultado = await Liquidaciones.guardarLiquidacion(solicitud.body);
        respuesta.json(resultado);
    } catch (error) {
        respuesta.status(500).json({ error: error.message });
    }
});

Router.get('/listar', async (solicitud, respuesta) => {
    try {
        const resultado = await Liquidaciones.listarLiquidaciones();
        respuesta.json(resultado);
    } catch (error) {
        respuesta.status(500).json({ error: error.message });
    }
});

module.exports = Router;
