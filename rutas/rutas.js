const rutasDelServicio1 = require('./Servicio1.js');
const rutasDeEmpleados = require('./Empleados.js');
const rutasDeUsuarios = require('./Usuarios.js');
const rutaDeAuditoria = require('./auditoria.js');
const rutasDeConceptos = require('./conceptos.js');
const rutasDeDepartamentos = require('./departamentos.js');
const rutasDeMovimientosPlanilla = require('./movimientos_planilla.js');
const rutasDePeriodosPlanilla = require('./periodos_planilla.js');
const rutasDePuestos = require('./puestos.js');


function asignarRutasAExpress(app) {
    app.use('/Servicio1', rutasDelServicio1); // Keep for backwards compatibility if needed
    app.use('/empleados', rutasDeEmpleados);
    app.use('/usuarios', rutasDeUsuarios);
    app.use('/auditoria', rutaDeAuditoria);
    app.use('/concepto', rutasDeConceptos);
    app.use('/departamentos', rutasDeDepartamentos);
    app.use('/movimientos_planilla', rutasDeMovimientosPlanilla);
    app.use('/periodos_planilla', rutasDePeriodosPlanilla);
    app.use('/puestos', rutasDePuestos);
}

module.exports = asignarRutasAExpress;
