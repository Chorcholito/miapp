
const express = require('express');
const passport = require('passport');
const pool = require('../database');


const GoogleStrategy = require('passport-google-oauth20').Strategy;

// used to serialize the user for the session
passport.serializeUser(function(user, done) {
  done(null, user); 
 // where is this user.id going? Are we supposed to access this anywhere?
});

// used to deserialize the user
passport.deserializeUser(function(user, done) {
      done(null, user);
});


passport.use(new GoogleStrategy({
    clientID: '183481378646-jjq5klomg9pmckk5brj0j0dofaoe66td.apps.googleusercontent.com',
    clientSecret: 'IK3Z6BvEng3NOKOkXB80Dp0k',
    callbackURL: "http://localhost:4000/google/callback"
  },
  async function  (accessToken, refreshToken, profile, done) {
    

    const nombre = profile.name.givenName;
    const objEmail= profile.emails[0];
    const email = objEmail.value;
    const objInsertUser={
      nombre,
      email
    }
    const usuario  = await pool.query('SELECT * FROM usuarios where email = ?', email);
    
    if (Object.entries(usuario).length === 0) {
      await pool.query('INSERT INTO usuarios SET ?',[objInsertUser]);
    }
    return done(null, profile);
  }

));

  
  
  
  
  
  
