const express = require('express');
const router = express.Router();
const pool = require('../database');




router.get('/agregarvalor', (req,res)=>{
    res.render('cuentas/agregarvalor');
});

//`Welcome mr ${req.user.displayName}! <a href="/logout">Sign In with Google</a>`
router.post('/agregarvalor', async (req,res)=>{
    
    console.log(req.body);

//   const {Prueba} = req.body;
//   const almatextprueba = {
//      Prueba
//      }
//    await pool.qry('INSERT INTOblabla nombretabla SET ?',[almatextprueba]);

    res.send('received');
});



module.exports = router;