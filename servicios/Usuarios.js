const { ejecutarConsulta } = require('../db.js');
const jwt = require('jsonwebtoken');

class Usuarios {
    constructor() { }

    PalabraSecreta = "MiPalabraSecreta";

    async usuarioslistar() {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios` ORDER BY username ASC");
    }

    async usuarioslistarEspecifico(username) {
        return await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios` WHERE username = ?", [username]);
    }

    async usuarioscrear(d) {
        let empleadoId = d.empleado_id;

        // Crea el empleado automáticamente si no provee el empleado_id
        if (!empleadoId) {
            const fechaIngreso = new Date().toISOString().slice(0, 10);
            const ts = Date.now().toString();
            const resEmpleado = await ejecutarConsulta(
                "INSERT INTO `planillasweb`.`empleados` (codigo_empleado, nombre, apellido, dni, fecha_ingreso, salario_base, puesto_id) VALUES (?,?,?,?,?,?,?)",
                [`USR-${ts}`, d.username, 'Autogenerado', `TMP-${ts.slice(-9)}`, fechaIngreso, 0, null]
            );
            
            if (resEmpleado && resEmpleado.insertId) {
                empleadoId = resEmpleado.insertId;
            } else {
                return { error: "No se pudo autogenerar el empleado en la base de datos." };
            }
        }

        const result = await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`usuarios` (username, password_hash, rol, empleado_id, estado, pregunta_seguridad, respuesta_seguridad, token) VALUES (?,?,?,?,?,?,?,?)",
            [d.username, d.password_hash, d.rol, empleadoId, d.estado, d.pregunta_seguridad, d.respuesta_seguridad, null]
        );

        if (result && result.insertId) {
            await ejecutarConsulta(
                "INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)",
                [d.usuario_accion_id || null, 'usuarios', result.insertId, 'INSERT', null, JSON.stringify(d)]
            );
        }

        return result;
    }


    async usuariosactualizar(id, d) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios` WHERE id=?", [id]);
        const valor_anterior = filas.length > 0 ? filas[0] : null;

        const result = await ejecutarConsulta(
            "UPDATE `planillasweb`.`usuarios` SET username=?, rol=?, empleado_id=?, estado=?, pregunta_seguridad=?, respuesta_seguridad=? WHERE id=?",
            [d.username, d.rol, d.empleado_id, d.estado, d.pregunta_seguridad, d.respuesta_seguridad, id]
        );

        if (result && result.affectedRows > 0) {
            await ejecutarConsulta(
                "INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)",
                [d.usuario_accion_id || null, 'usuarios', id, 'UPDATE', JSON.stringify(valor_anterior), JSON.stringify(d)]
            );
        }

        return result;
    }
    async usuarioseliminar(id) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios` WHERE id=?", [id]);
        const valor_anterior = filas.length > 0 ? filas[0] : null;

        const result = await ejecutarConsulta("DELETE FROM `planillasweb`.`usuarios` WHERE id=?", [id]);

        if (result && result.affectedRows > 0) {
            await ejecutarConsulta(
                "INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)",
                [null, 'usuarios', id, 'DELETE', JSON.stringify(valor_anterior), null]
            );
        }

        return result;
    }
    
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

    async DesAutenticacion(username) {
        // Borrar del usuario el token que tenga
        return await ejecutarConsulta('UPDATE usuarios SET token = NULL WHERE username = ?', [username]);
    }
};

module.exports = new Usuarios();
