const rutasDelServicio1 = require('./Servicio1.js');
const rutasDeEmpleados = require('./Empleados.js');


function asignarRutasAExpress(app) {
    app.use('/Servicio1', rutasDelServicio1);
    app.use('/Empleados', rutasDeEmpleados);

}

module.exports = asignarRutasAExpress;
