const express = require('express');
const routes = express.Router();
const { isLoggedIn } = require('../lib/auth');
const passport = require('passport');
const pool = require('../database');

routes.get('/add', isLoggedIn, (req, res)=>{
    res.render('buy.hbs')
});

routes.get('/alert', isLoggedIn, (req, res)=>{
    res.render('alert.hbs')
});
routes.get('/success', isLoggedIn, (req, res)=>{
    res.render('success.hbs')
});

routes.post('/add', isLoggedIn, async(req, res, done)=>{
    const {numId, numCard, nameCard, cvv,vencimiento} = req.body;
    const newBuy = {
        numId, 
        numCard, 
        nameCard, 
        cvv, 
        vencimiento, 
    };
    const solicitud = await pool.query('SELECT estado_de_solicitud FROM solicitudes WHERE ID_solicitud =?',[numId]); 
    if(solicitud[0].estado_de_solicitud == 'Aceptado'){
        await pool.query('INSERT INTO compras set ? ', [newBuy]);
        res.redirect('/buy/success')
    }else{
        res.redirect('/buy/alert')  
    }
    pool.end()
});




module.exports = routes;