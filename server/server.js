const express = require("express")
const app = express()
const path = require("path")
const bodyParser = require('body-parser')
const session = require('express-session');

const keys = require('./keys.json')
const verifier = require('google-id-token-verifier')

const utils = require('./utils/utils.js')

//temp
const PythonShell = require('python-shell')

//utils
//var emails = utils.getAuthorizedEmails()

/*
PLEASE FIX THIS HORRIBLE CODE BELOWWWWW!!!!!!!!!!!!!!!!!!!!
*/
//gets list of authorized user emails (teachers)
var emails = []

PythonShell.run('utils/emails.py', function (err, results) {
    if (err) throw err
    emails = results

    console.log("Authorized emails:")
    for(let i = 0; i < emails.length; i++) {
        //emails[i] = emails[i].slice(0, emails[i].length - 1) //Comment this line out on production server (windows specific)
        console.log(emails[i])
    }
    emails.push('benkosten@gmail.com')
})
//End of horrible CODE

//express setup
app.use(express.static(__dirname + '/static'))
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(session({
  name: 'server-session-cookie-id',
  secret: 'Doesithavetobeaphrase?',
  saveUninitialized: true,
  resave: true,
}))

//handle auth
function checkAuth(req, res, next) {
    if(!req.session.user_id) {
        res.status(401).send('Unauthorized')
    }

    else {
        //dont cache restricted pages
        res.header('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
        next()
    }
}

//handle signin
app.get('/g-signin', function(req, res) {
    var g_token = req.query["token"]
    verifier.verify(g_token, keys['web']['client_id'], function (err, tokenInfo) {
        if (!err) {
            if(emails.includes(tokenInfo['email'])) {
                //store token for auth
                req.session.user_id = tokenInfo['sub']
                res.sendFile(__dirname + '/views/client_page.html')
            }

            else {
                res.sendFile(__dirname + '/views/forbidden.html')
            }
        }
    })
})

app.post('/api/announcements',  checkAuth, function(req, res) {
    utils.postAnnouncements(req.body)
    //res.sendFile(__dirname + '/views/client_page.html')
    res.redirect("/")
})

app.delete('/api/announcements', checkAuth, function(req, res) {
    utils.deleteAnnouncement(req.query)
    //res.sendFile(__dirname + '/views/client_page.html')
    res.redirect("/")
})

app.get('/api/announcements', function(req, res) {
    utils.getAnnouncements(function(err, data) {
        if(!err) {
            res.json(data)
        }
    })
})

// Starts the server.
app.listen(3000, function() {
    console.log('Starting server on port 3000')
});
