const { ejecutarConsulta } = require('../db.js');

class Roles {
    async listar() {
        return await ejecutarConsulta("SELECT * FROM roles ORDER BY id ASC");
    }

    async crear(d) {
        return await ejecutarConsulta(
            "INSERT INTO roles (nombre, descripcion) VALUES (?, ?)",
            [d.nombre, d.descripcion]
        );
    }

    async actualizar(id, d) {
        return await ejecutarConsulta(
            "UPDATE roles SET nombre = ?, descripcion = ? WHERE id = ?",
            [d.nombre, d.descripcion, id]
        );
    }

    async eliminar(id) {
        // Validar si hay usuarios usando este rol antes de borrar
        const usuarios = await ejecutarConsulta("SELECT count(*) as total FROM usuarios WHERE rol_id = ?", [id]);
        if (usuarios[0].total > 0) {
            throw new Error("No se puede eliminar un rol que está asignado a usuarios");
        }
        return await ejecutarConsulta("DELETE FROM roles WHERE id = ?", [id]);
    }
}

module.exports = new Roles();
