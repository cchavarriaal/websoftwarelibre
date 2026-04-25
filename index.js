const express = require('express');
const cors = require('cors');
const asignarRutasAExpress = require('./rutas/rutas.js');

const Usuarios = require('./servicios/Usuarios.js');

const app = express();
app.use(express.json());
app.use(cors());

// Middleware de Autenticación Global
app.use(async (req, res, next) => {
  // Rutas públicas
  if (req.path === '/usuarios/autenticar' || req.path === '/usuarios/validarToken') {
    return next();
  }

  const user = await Usuarios.ValidarToken(req);
  if (user && !(user instanceof Error)) {
    req.user = user;
    next();
  } else {
    // Bloqueo estricto para rutas protegidas
    return res.status(401).json({ 
      error: 'Sesión inválida o expirada',
      message: 'Debe iniciar sesión para acceder a este recurso'
    });
  }
});

asignarRutasAExpress(app);

const servidor = app.listen(80, () => {
  console.log('Backend corriendo en el puerto 80.');  
});
