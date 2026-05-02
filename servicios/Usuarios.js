const { ejecutarConsulta } = require('../db.js');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

class Usuarios {
    constructor() { }

    PalabraSecreta = "MiPalabraSecreta";

    async usuarioslistar() {
        return await ejecutarConsulta(`
            SELECT u.*, r.nombre AS rol_nombre, CONCAT(e.nombre, ' ', e.apellido) AS empleado_nombre 
            FROM planillasweb.usuarios u 
            LEFT JOIN planillasweb.roles r ON u.rol_id = r.id
            LEFT JOIN planillasweb.empleados e ON u.empleado_id = e.id 
            ORDER BY u.username ASC
        `);
    }

    async usuarioslistarEspecifico(username) {
        return await ejecutarConsulta(`
            SELECT u.*, r.nombre AS rol_nombre 
            FROM usuarios u 
            LEFT JOIN roles r ON u.rol_id = r.id 
            WHERE u.username = ?`, [username]);
    }

    async usuarioscrear(d) {
        let empleadoId = d.empleado_id || null;
        const rolId = d.rol_id || 4; // Por defecto Empleado

        // Solo crea el empleado si el usuario lo solicita explícitamente
        if (!empleadoId && d.crear_empleado === true) {
            if (!d.dni_empleado || d.dni_empleado.trim() === '') {
                return { error: "Debe ingresar el DNI/Cédula del empleado para poder generarlo." };
            }
            const fechaIngreso = new Date().toISOString().slice(0, 10);
            
            try {
                const { crearObjetoConexion } = require('../db.js');
                const conn = await crearObjetoConexion();
                try {
                    // Generar codigo_empleado único consultando el próximo ID disponible
                    const [maxRows] = await conn.query("SELECT COALESCE(MAX(id), 0) + 1 AS nextId FROM `planillasweb`.`empleados`");
                    const nextId = maxRows[0].nextId;
                    const codigoEmpleado = `EMP-${new Date().getFullYear()}${String(nextId).padStart(3, '0')}`;

                    const [resEmpleado] = await conn.query(
                        "INSERT INTO `planillasweb`.`empleados` (codigo_empleado, nombre, apellido, dni, fecha_ingreso, salario_base, puesto_id) VALUES (?,?,?,?,?,?,?)",
                        [codigoEmpleado, d.nombre_empleado?.trim(), d.apellido_empleado?.trim(), d.dni_empleado.trim(), fechaIngreso, 0, null]
                    );
                    empleadoId = resEmpleado.insertId;
                } finally {
                    await conn.end();
                }
            } catch (err) {
                console.error('Error al crear empleado:', err.message);
                if (err.code === 'ER_DUP_ENTRY') {
                    if (err.message.includes('codigo_empleado')) {
                        return { error: "Error de código de empleado duplicado. Intente nuevamente." };
                    }
                    return { error: `El DNI "${d.dni_empleado.trim()}" ya existe en la base de datos. Ingrese un DNI diferente.` };
                }
                return { error: `Error al generar empleado: ${err.message}` };
            }
        }

        // ENCRIPTAR CONTRASEÑA
        const salt = await bcrypt.genSalt(10);
        const passwordEncriptada = await bcrypt.hash(d.password_hash, salt);

        const result = await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`usuarios` (username, password_hash, rol_id, empleado_id, estado, pregunta_seguridad, respuesta_seguridad, token) VALUES (?,?,?,?,?,?,?,?)",
            [d.username, passwordEncriptada, rolId, empleadoId, d.estado, d.pregunta_seguridad, d.respuesta_seguridad, null]
        );

        if (result && result.insertId) {
            await ejecutarConsulta(
                "INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)",
                [d.usuario_accion_id || null, 'usuarios', result.insertId, 'INSERT', null, JSON.stringify(d)]
            );
        }

        return result;
    }

    // Genera un empleado para un usuario existente que no tiene uno asignado
    async generarEmpleadoParaUsuario(usuarioId, dni, nombre, apellido) {
        // Validar DNI
        if (!dni || dni.trim() === '') {
            return { error: "Debe ingresar el DNI/Cédula del empleado para poder generarlo." };
        }

        // Verificar que el usuario exista y no tenga empleado
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios` WHERE id=?", [usuarioId]);
        if (!filas || filas.length === 0) {
            return { error: "Usuario no encontrado." };
        }
        const usuario = filas[0];
        if (usuario.empleado_id) {
            return { error: "Este usuario ya tiene un empleado asignado." };
        }

        // Crear el empleado
        const fechaIngreso = new Date().toISOString().slice(0, 10);
        let nuevoEmpleadoId;

        try {
            const { crearObjetoConexion } = require('../db.js');
            const conn = await crearObjetoConexion();
            try {
                // Generar codigo_empleado único consultando el próximo ID disponible
                const [maxRows] = await conn.query("SELECT COALESCE(MAX(id), 0) + 1 AS nextId FROM `planillasweb`.`empleados`");
                const nextId = maxRows[0].nextId;
                const codigoEmpleado = `EMP-${new Date().getFullYear()}${String(nextId).padStart(3, '0')}`;

                const [resEmpleado] = await conn.query(
                    "INSERT INTO `planillasweb`.`empleados` (codigo_empleado, nombre, apellido, dni, fecha_ingreso, salario_base, puesto_id) VALUES (?,?,?,?,?,?,?)",
                    [codigoEmpleado, nombre?.trim(), apellido?.trim(), dni.trim(), fechaIngreso, 0, null]
                );
                nuevoEmpleadoId = resEmpleado.insertId;
            } finally {
                await conn.end();
            }
        } catch (err) {
            console.error('Error al crear empleado:', err.message);
            if (err.code === 'ER_DUP_ENTRY') {
                if (err.message.includes('codigo_empleado')) {
                    return { error: "Error de código de empleado duplicado. Intente nuevamente." };
                }
                return { error: `El DNI "${dni.trim()}" ya existe en la base de datos. Ingrese un DNI diferente.` };
            }
            return { error: `Error al generar empleado: ${err.message}` };
        }

        // Vincular el empleado al usuario
        await ejecutarConsulta(
            "UPDATE `planillasweb`.`usuarios` SET empleado_id=? WHERE id=?",
            [nuevoEmpleadoId, usuarioId]
        );

        // Auditoría
        await ejecutarConsulta(
            "INSERT INTO `planillasweb`.`auditoria` (usuario_id, tabla_afectada, registro_id, accion, valor_anterior, valor_nuevo) VALUES (?,?,?,?,?,?)",
            [usuarioId, 'usuarios', usuarioId, 'UPDATE', JSON.stringify({ empleado_id: null }), JSON.stringify({ empleado_id: nuevoEmpleadoId })]
        );

        return { success: true, empleado_id: nuevoEmpleadoId };
    }


    async usuariosactualizar(id, d) {
        const filas = await ejecutarConsulta("SELECT * FROM `planillasweb`.`usuarios` WHERE id=?", [id]);
        const valor_anterior = filas.length > 0 ? filas[0] : null;

        let query = "UPDATE `planillasweb`.`usuarios` SET username=?, rol_id=?, empleado_id=?, estado=?, pregunta_seguridad=?, respuesta_seguridad=?";
        let params = [d.username, d.rol_id, d.empleado_id, d.estado, d.pregunta_seguridad, d.respuesta_seguridad];

        if (d.password_hash && d.password_hash.trim() !== '') {
            const salt = await bcrypt.genSalt(10);
            const passwordEncriptada = await bcrypt.hash(d.password_hash, salt);
            query += ", password_hash=?";
            params.push(passwordEncriptada);
        }

        query += " WHERE id=?";
        params.push(id);

        const result = await ejecutarConsulta(query, params);

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
        const resultado = await ejecutarConsulta(`
            SELECT u.*, r.nombre AS rol_nombre 
            FROM usuarios u 
            JOIN roles r ON u.rol_id = r.id 
            WHERE u.username = ?`, [username]);
        
        if (resultado.length === 0) return false;
        
        const Usuario = resultado[0];

        // Intento de comparación con Bcrypt
        let esValida = false;
        try {
            esValida = await bcrypt.compare(ClaveSinEncriptar, Usuario.password_hash);
        } catch (e) {
            // Si falla el hash (ej. es texto plano antiguo), probamos comparación directa
            esValida = (ClaveSinEncriptar === Usuario.password_hash);
        }

        // Fallback por si la DB tiene texto plano (para no bloquear al usuario ahora)
        if (!esValida) {
            esValida = (ClaveSinEncriptar === Usuario.password_hash);
        }

        if (esValida) {
            return this.GenerarToken(Usuario.rol_nombre, Usuario.username, Usuario.empleado_id, Usuario.id);
        }
        return false;
    };

    async GenerarToken(rol_nombre, username, empleado_id, usuario_id) {
        console.log(`Generando token para: ${username}, Rol: ${rol_nombre}`);
        let token = jwt.sign({ 
            rol: rol_nombre, 
            username, 
            empleado_id, 
            usuario_id 
        }, this.PalabraSecreta, { expiresIn: '4h' });
        
        const res = await ejecutarConsulta('UPDATE usuarios SET token = ? WHERE username = ?', [token, username]);
        console.log(`Token guardado en DB para ${username}. Filas afectadas: ${res?.affectedRows}`);
        
        return { token, rol: rol_nombre, username, empleado_id };
    }





    

    async ValidarToken(solicitud) {
        let token;
        try {
            const authHeader = solicitud.headers.authorization;
            if (!authHeader) return false;
            token = authHeader.split(" ")[1];
        } catch (err) {
            return false;
        }

        let payload;
        try {
            payload = await jwt.verify(token, this.PalabraSecreta);
        } catch (err) {
            return false;
        }

        // Buscar información fresca del usuario en la base de datos
        const rows = await ejecutarConsulta(`
            SELECT u.*, r.nombre AS rol 
            FROM usuarios u 
            JOIN roles r ON u.rol_id = r.id 
            WHERE u.username = ?`, [payload.username]);

        if (!rows || rows.length === 0) {
            return false;
        }

        const usuarioDB = rows[0];

        // Validar que el token coincida con el guardado (Session Control)
        if (usuarioDB.token !== token) {
            return false;
        }

        // Retornar objeto con datos actualizados para que el resto del backend los use
        return {
            usuario_id: usuarioDB.id,
            username: usuarioDB.username,
            rol: usuarioDB.rol,
            empleado_id: usuarioDB.empleado_id
        };
    };

    async DesAutenticacion(username) {
        // Borrar del usuario el token que tenga
        return await ejecutarConsulta('UPDATE usuarios SET token = NULL WHERE username = ?', [username]);
    }
};

module.exports = new Usuarios();
