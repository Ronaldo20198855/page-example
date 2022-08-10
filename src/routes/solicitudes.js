const { Router } = require('express');
const express = require('express');
const routes = express.Router();
const { isLoggedIn } = require('../lib/auth');
const pool = require('../database')

routes.get('/add', isLoggedIn,(req, res)=>{
    res.render('solicitud.hbs')
});

routes.post('/add', async (req, res)=>{
    const {tipo_de_solicitud, prueba_solicitada, ID_usuario = req.user.ID_usuario} = req.body;
    const newSolicitud = {
        tipo_de_solicitud,
        prueba_solicitada,
        ID_usuario
    };
    await pool.query('INSERT INTO SOLICITUDES set ? ', [newSolicitud]);
    res.redirect('/solicitudes')
});

routes.get('/', isLoggedIn, async (req, res)=>{

   const ID_usuario = req.user.ID_usuario;
   let acceso = '';
   let solicitudes;
   if (req.user.nivel_de_acceso == 'admin') {
    acceso = true;
    solicitudes = await pool.query('SELECT * FROM solicitudes')
   }else{
    solicitudes = await await pool.query('SELECT * FROM solicitudes WHERE ID_usuario = ?', [ID_usuario])
    acceso = false;
   }
   res.render('solicitudes.hbs', { solicitudes , acceso})
})

routes.get('/aceptar/:ID_solicitud', isLoggedIn, async(req, res)=>{
    const{ ID_solicitud } = req.params;
    await pool.query('UPDATE `solicitudes` SET `estado_de_solicitud` = "Aceptado" WHERE `solicitudes`.`ID_solicitud` = ?',[ID_solicitud])
    res.redirect('/solicitudes')
})
routes.get('/negar/:ID_solicitud',isLoggedIn, async(req, res)=>{
    const{ ID_solicitud } = req.params;
    await pool.query('UPDATE `solicitudes` SET `estado_de_solicitud` = "Negado" WHERE `solicitudes`.`ID_solicitud` = ?',[ID_solicitud])
    res.redirect('/solicitudes')
})


module.exports = routes;