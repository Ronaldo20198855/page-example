const express = require('express');
const routes = express.Router();
const passport = require('passport');
const { isNotLoggedIn } = require('../lib/out');
const { isLoggedIn } = require('../lib/auth');

const pool = require('../database')

routes.get('/signin', isNotLoggedIn,(req, res)=>{
    res.render('login.hbs')
});

routes.post('/signin',isNotLoggedIn, (req, res, next)=>{
    passport.authenticate('local.signin', {
        successRedirect: '/',
        failureRedirect: '/login/signin',
        failureFlash: true
    })(req, res, next);
});

routes.get('/logout', isLoggedIn,(req, res, next)=>{
    req.logOut(req.user, err=>{
        if(err)return next(err);
        res.redirect('/login/signin')
    });
});

module.exports = routes;