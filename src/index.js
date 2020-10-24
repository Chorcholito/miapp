


const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const passport = require('passport');
var cookieSession = require('cookie-session')
require('./routes/passport');



//initializaions
const app = express(); 




// setings
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./libs/handlebars')
}));
app.set ('view engine', '.hbs');


// middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({extended:false}));
app.use(express.json());



app.use(cookieSession({
    name: 'session',
    keys: ['key1', 'key2']
  }))


app.use(passport.initialize()); // Add passport initialization
app.use(passport.session());    // Add passport initialization

app.get('/some_path',checkAuthentication,function(req,res){
   res.send('adsasdsa');
});
function checkAuthentication(req,res,next){
    //console.log(req);
    if(req.user){
        //req.isAuthenticated() will return true if user is logged in
        next();
    } else{
        res.redirect("/");
    }
}

// global variables
app.use((req,res,next)=>{
    next();
});

// routes
app.use(require('./routes'));


app.use('/micuenta', require('./routes/micuenta'));


// public 
app.use(express.static(path.join(__dirname,'public')));





// inicio cosa loca



// Auth middleware that checks if the user is logged in



// required for passport session



// Initializes passport and passport sessions







app.get('/', passport.authenticate('google', { scope: ['profile', 'email'] }));

app.get('/google/callback', passport.authenticate('google', { failureRedirect: '/failed' }),
  function(req, res) {
    // Successful authentication, redirect home.
    res.redirect('/vistaPrincipal');
  }
);


// Example protected and unprotected routes
//app.get('/', (req, res) => res.send('Example Home page!'));
app.get('/failed', (req, res) => res.send('You Failed to log in!'));

// In this route you can see that if the user is logged in u can acess his info in: req.user

// Auth Routes




app.get('/logout', (req, res) => {
    req.session = null;
    req.logout();
    res.redirect('/sefue');
})




// fin cosa loca




// starting the server

app.listen(app.get('port'),()=>{
    console.log('servidor en el puerto', app.get('port'));
});