const mysql = require('mysql');
const {database} = require('./keys');
const {promisify} = require('util');


  
  var connection; 
  
  function pool() {
    connection = mysql.createConnection(database); 
                                                    
  
    connection.connect(function(err) {              
      if(err) {                                     
        console.log('error when connecting to db:', err);
        setTimeout(pool, 2000); 
      }                                    
    });                                     
                                            
    connection.on('error', function(err) {
      console.log('db error', err);
      if(err.code === 'PROTOCOL_CONNECTION_LOST') { 
        pool();                         
      } else {                                      
        throw err;                                  
      }
    });
  }
  pool()
  module.exports = pool;



/*
const pool = mysql.createPool(database);

pool.getConnection((err, connection)=>{
    
    if(err){
        if(err === 'PROTOCOL_CONNECTION_LOST'){
            
            console.error('La coneccion con la BD fue cerrada')

        }
        if(err === 'ER_CON_COUNT_ERROR'){
            console.error('La DB tiene muchas conneciones')
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
*/
