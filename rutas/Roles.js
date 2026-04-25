const express = require('express');
const router = express.Router();
const Roles = require('../servicios/Roles.js');

router.get('/listar', async (req, res) => {
    try {
        const resultado = await Roles.listar();
        res.json(resultado);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.post('/crear', async (req, res) => {
    try {
        const resultado = await Roles.crear(req.body);
        res.json(resultado);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.put('/actualizar/:id', async (req, res) => {
    try {
        const resultado = await Roles.actualizar(req.params.id, req.body);
        res.json(resultado);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.delete('/eliminar/:id', async (req, res) => {
    try {
        const resultado = await Roles.eliminar(req.params.id);
        res.json(resultado);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
