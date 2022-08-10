const mysql = require('mysql');
const {database} = require('./keys');
const {promisify} = require('util');


const pool = mysql.createPool(database);

pool.getConnection((err, connection)=>{
    if(err){
        if(err === 'PROTOCOL_CONNECTION_LOST'){
            console.error('La coneccion con la base de datos fue cerrada')
        }
        if(err === 'ER_CON_COUNT_ERROR'){
            console.error('La DATABESE tiene muchas conneciones')
        }
        if(err.code === 'ECONNREFUSED'){
            console.error('La coneccion ha sido rechasada')
        }
        if(err) throw err;
    }

    if(connection){
        connection.release();
        console.log('db is connected');
        return;
    }
});

pool.query = promisify(pool.query);

module.exports = pool;