const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { ejecutarConsulta } = require('../db.js');
const usuarios = require('../servicios/Usuarios.js');

class Usuarios{
    constructor() { };

    PalabraSecreta = "MiPalabraSecreta";

    async Autenticacion(username, ClaveSinEncriptar) {
        // Consultar en la base de datos si el usuario y la clave coinciden
        const resultado = await ejecutarConsulta('SELECT * FROM usuarios WHERE username = ?', [username]);
        
        // Validar si el usuario existe
        if (resultado.length === 0) {
            return false; // Usuario no encontrado
        }
        
        const Usuario = resultado[0];
        // Comparar la contraseña sin encriptar con la almacenada (encriptada)
        try {
           // const Resultado = await bcrypt.compare(ClaveSinEncriptar, Usuario.password_hash);
           const Resultado = (ClaveSinEncriptar === Usuario.password_hash); // Para pruebas sin encriptar
            if (Resultado === true) {
                //return true; // Autenticación exitosa
               return this.GenerarToken(Usuario.Rol, Usuario.username);
            } else {
                return false;
            }
        } catch (err) {
            console.log(err);
            return false;
        }
    };





    async GenerarToken(Rol, username) {
        let token = jwt.sign({ Rol, username }, this.PalabraSecreta, { expiresIn: '10m' });
        // Almacenar en la base de datos para el usuario
        await ejecutarConsulta('UPDATE usuarios SET token = ? WHERE username = ?', [token, username]);
        return token;
    }





    

    async ValidarToken(solicitud) {
        let token;
        try {
            token = solicitud.headers.authorization.split(" ")[1];
        } catch (err) {
            return err;
        }
        let Resultado;
        // Validación del token
        try {
            Resultado = await jwt.verify(token, this.PalabraSecreta);
        } catch (err) {
            return err;
        }
        // Se debe validar que el usuario tenga asignado ese token
        const rows = await ejecutarConsulta('SELECT * FROM usuarios WHERE username = ?', [Resultado.username]);
        if (rows.length === 0) {
            return false; // usuario no encontrado
        }
        const Usuario = rows[0];

        if (Usuario.token === token) {
            return Resultado;
        } else {
            return false;
        }
    };

    async DesAutenticacion(CorreoElectronico) {
        // Borrar del usuario el token que tenga
    }
};

module.exports = new Usuarios();
