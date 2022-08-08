const express = require ('express');
const morgan = require('morgan');
const {engine} = require('express-handlebars');
const path = require('path');
const session = require('express-session');
const passport = require('passport');
const flash = require('connect-flash')
const {database} = require('./keys'); 
const MySQLStore = require('express-mysql-session');

/*inicializacion de express*/
const app = express();
require('./lib/passport');

/*settings*/
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', engine({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}))
app.set('views engine', '.hbs');


/*middelwares*/
app.use(flash());
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());
app.use(session({
        secret: 't&qsqlsession',
        resave: false,
        saveUninitialized: false,
        store:  new MySQLStore(database)
}));
app.use(passport.initialize());
app.use(passport.session());


//Global vairables
app.use((req, res, next)=>{
    app.locals.success = req.flash('success');
    app.locals.success = req.flash('messages');
    app.locals.user = req.user;
    next();
})

//routes
app.use(require('./routes/'));
app.use('/solicitudes',require('./routes/solicitudes'))
app.use('/buy',require('./routes/buy'))
app.use('/login',require('./routes/login'))
app.use('/registro',require('./routes/registro'))



//public
app.use(express.static(path.join(__dirname, 'public')))


//starting the server

app.listen(app.get('port'), ()=>{
console.log("server on port", app.get('port'))
})