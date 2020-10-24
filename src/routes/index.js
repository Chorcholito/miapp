const express = require('express');
const passport = require('passport');
const router = express.Router();



router.get('/vistaPrincipal', (req,res)=>{

    res.render('usuario/vistaPrincipal');
});

module.exports = router;