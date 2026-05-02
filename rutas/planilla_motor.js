const express = require('express');
const router = express.Router();
const planillaMotor = require('../servicios/planilla_motor.js');

// POST: Procesar la planilla de un periodo
// Acepta ID en el cuerpo (body) o en la URL (params)
router.post(['/procesar', '/procesar/:id'], async (req, res) => {
    try {
        const periodoId = req.body.periodoId || req.params.id;
        if (!periodoId) throw new Error("ID de periodo no proporcionado");
        
        const resultado = await planillaMotor.procesarPlanilla(periodoId);
        res.json(resultado);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// GET: Obtener los resultados calculados de un periodo
router.get('/resultados/:periodoId', async (req, res) => {
    try {
        const isEmployee = req.user?.rol === 'Empleado';
        const empId = isEmployee ? req.user.empleado_id : null;

        // Seguridad: Si es empleado pero no tiene ID vinculado, no mostrar nada
        if (isEmployee && !empId) {
            return res.json([]);
        }

        const resultados = await planillaMotor.obtenerResultados(req.params.periodoId, empId);
        res.json(resultados);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// GET: Obtener el detalle completo para una boleta de pago
router.get('/detalle-boleta/:id', async (req, res) => {
    try {
        const empId = req.user?.rol === 'Empleado' ? req.user.empleado_id : null;
        const boleta = await planillaMotor.obtenerDetalleBoleta(req.params.id, empId);
        if (!boleta) return res.status(404).json({ error: "Boleta no encontrada o acceso denegado" });
        res.json(boleta);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;
