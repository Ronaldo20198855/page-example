const express = require('express');
const routes = express.Router();
const passport = require('passport');
const { isNotLoggedIn } = require('../lib/out');
const pool = require('../database')

routes.get('/signup',isNotLoggedIn, (req, res)=>{
    res.render('registro.hbs')
});
/*
routes.post('/signup', async(req, res)=>{
    const {nombre, nombre_usuario, correo, contraseña, direccion, telefono} = req.body;
    const newUser = {
        nombre, 
        nombre_usuario, 
        correo, 
        contraseña, 
        direccion, 
        telefono
    };
    await pool.query('INSERT INTO usuario set ? ', [newUser]);
    res.send('recived')
});*/

routes.post('/signup',isNotLoggedIn, passport.authenticate('local.signup', {
        successRedirect: '/',
        failureRedirect: '/registro/signup',
        failureFlash: true
    }));

module.exports = routes;