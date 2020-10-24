const mysql = require('mysql');
const { promisify } = require('util');


const {database} = require('./keys');


const pool = mysql.createPool(database);
pool.getConnection((err,connection)=>{
    if(err) {
        if (err.code==='PROTOCOL_CONNECTION_LOST') {
            console.error('la coneccion con la base de datos dio mal');
        }
        if (err.code === 'ER_CON_COUNT_ERROR'){
            console.error('la base de datos tiene muchas conecciones');
        }
        if (err.code === 'ECONNREFUSED'){
            console.error('la coexion fue rechazada');
        }

    }

    if(connection) connection.release();
    console.log('la vase de datos esta conectada');
    return;
});
// estoy cconvirtiendo promesas lo que antes era en colbac. que carajo sera
pool.query = promisify(pool.query);

module.exports= pool;