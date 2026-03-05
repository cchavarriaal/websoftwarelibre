const express = require('express');
const Router = express.Router();

const Usuarios = require('../servicios/usuarios.js');

// Usuarios routes
Router.get('/usuarioslistar', async (solicitud, respuesta, next) => {
  return respuesta.json(await Usuarios.usuarioslistar());
});
Router.post('/usuarioslistarEspecifico', async (solicitud, respuesta, next) => {
  return respuesta.json(await Usuarios.usuarioslistarEspecifico(solicitud.body.username));
});
Router.post('/usuarioscrear', async (solicitud, respuesta, next) => {
  return respuesta.json(await Usuarios.usuarioscrear(solicitud.body));
});
Router.put('/usuariosactualizar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Usuarios.usuariosactualizar(solicitud.params.id, solicitud.body));
});
Router.delete('/usuarioseliminar/:id', async (solicitud, respuesta, next) => {
  return respuesta.json(await Usuarios.usuarioseliminar(solicitud.params.id));
});
Router.post("/autenticar", async (solicitud, respuesta) => {
  respuesta.json(await Usuarios.Autenticacion(solicitud.body.username, solicitud.body.password_hash));
});

Router.post("/validarToken", async (solicitud, respuesta) => {
  respuesta.json(await Usuarios.ValidarToken(solicitud));
});

Router.post("/desautenticar", async (solicitud, respuesta) => {
  respuesta.json(await Usuarios.DesAutenticacion(solicitud.body.username));
});


module.exports = Router;