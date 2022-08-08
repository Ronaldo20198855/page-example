const passport = require('passport');
const localStrategy = require('passport-local').Strategy;
const pool = require('../database');
const helper = require('../lib/helpers')

passport.use('local.signin', new localStrategy({
    usernameField: 'username',
    passwordField: 'pass',
    passReqToCallback: true
    
},async(req, username, pass, done)=>{
    const rows = await pool.query('SELECT * FROM usuario WHERE nombre_usuario = ? ', [username]);
    if(rows.length > 0 ){
        const user = rows[0];
        const validPass = await helper.matchPass(pass, user.contraseña);
        if(validPass){
            done(null, user)
        }else{
            done(null, false, req.flash('messages','contraseña incorrecta'))
        }
    }else{
       return done(null, false, req.flash('messages','usuario incorrecto'))
    }
}));

passport.use('local.signup', new localStrategy({

    usernameField: 'nombre_usuario',
    passwordField: 'contraseña',
    passReqToCallback: true
},
async (req, nombre_usuario, contraseña, done)=>{

    const {nombre, correo, direccion, telefono} = req.body;
    const newUser = {
        nombre, 
        nombre_usuario, 
        correo, 
        contraseña, 
        direccion, 
        telefono
    };
    newUser.contraseña = await helper.encrypPass(contraseña);
    const result = await pool.query('INSERT INTO usuario set ? ', [newUser]);
    newUser.ID_usuario = result.insertId;
    return done(null, newUser);
}));

passport.serializeUser((user, done)=>{
    done(null, user.ID_usuario)
})

passport.deserializeUser(async(id, done)=>{
    const rows = await pool.query('SELECT * FROM usuario WHERE ID_usuario = ?', [id]);
    done(null, rows[0]);
});