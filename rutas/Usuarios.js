const express = require("express");

const Router = express.Router();

const ServicioUsuarios = require('../servicios/Usuarios.js');
//const Usuarios = new ServicioUsuarios();

Router.post("/autenticar", async (solicitud, respuesta) => {
  respuesta.json(await ServicioUsuarios.Autenticacion(solicitud.body.username, solicitud.body.password_hash));
});

Router.post("/validarToken", async (solicitud, respuesta) => {
  respuesta.json(await ServicioUsuarios.ValidarToken(solicitud));
});

Router.post("/desautenticar", async (solicitud, respuesta) => {
  respuesta.json(await ServicioUsuarios.DesAutenticacion(solicitud.body.username));
});

module.exports = Router;