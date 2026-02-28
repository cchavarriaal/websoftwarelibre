const rutasDelServicio1 = require('./Servicio1.js');
const rutasDeEmpleados = require('./Empleados.js');
const rutasDeUsuarios = require('./Usuarios.js');


function asignarRutasAExpress(app) {
    app.use('/Servicio1', rutasDelServicio1);
    app.use('/Empleados', rutasDeEmpleados);
    app.use('/Usuarios', rutasDeUsuarios);

}

module.exports = asignarRutasAExpress;
