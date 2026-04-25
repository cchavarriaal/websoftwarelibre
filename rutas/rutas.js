
const rutasDeEmpleados = require('./Empleados.js');
const rutasDeUsuarios = require('./Usuarios.js');
const rutaDeAuditoria = require('./auditoria.js');
const rutasDeConceptos = require('./conceptos.js');
const rutasDeDepartamentos = require('./departamentos.js');
const rutasDeMovimientosPlanilla = require('./movimientos_planilla.js');
const rutasDePeriodosPlanilla = require('./periodos_planilla.js');
const rutasDePuestos = require('./puestos.js');
const rutasDeHorarios = require('./horarios.js');
const rutasDePlanillaMotor = require('./planilla_motor.js');
const rutasDeLiquidaciones = require('./liquidaciones.js');


function asignarRutasAExpress(app) {
    app.use('/empleados', rutasDeEmpleados);
    app.use('/usuarios', rutasDeUsuarios);
    app.use('/auditoria', rutaDeAuditoria);
    app.use('/concepto', rutasDeConceptos);
    app.use('/departamentos', rutasDeDepartamentos);
    app.use('/movimientos_planilla', rutasDeMovimientosPlanilla);
    app.use('/periodos_planilla', rutasDePeriodosPlanilla);
    app.use('/puestos', rutasDePuestos);
    app.use('/horarios', rutasDeHorarios);
    app.use('/planilla', rutasDePlanillaMotor);
    app.use('/liquidaciones', rutasDeLiquidaciones);
}

module.exports = asignarRutasAExpress;
