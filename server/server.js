const express = require("express")
const app = express()
const path = require("path")
const bodyParser = require('body-parser')

const keys = require('./keys.json')
const verifier = require('google-id-token-verifier')

const utils = require('./utils/utils.js')

//temp
const PythonShell = require('python-shell')

//utils
//var emails = utils.getAuthorizedEmails()

/*
PLEASE FIX THIS HORRIBLE CODE BELOWWWWW
*/
var emails = []

PythonShell.run('utils/emails.py', function (err, results) {
    if (err) throw err
    emails = results

    console.log("Authorized emails:")
    for(let i = 0; i < emails.length; i++) {
        emails[i] = emails[i].slice(0, emails[i].length - 1)
        console.log(emails[i])
    }
    emails.push('benkosten@gmail.com')
})

//express setup
app.use(express.static(__dirname + '/static'))
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())

//handle signin
app.get('/g-signin', function(req, res) {
    var g_token = req.query["token"]
    verifier.verify(g_token, keys['web']['client_id'], function (err, tokenInfo) {
        if (!err) {
            console.log(emails)
            if(emails.includes(tokenInfo['email'])) {
                res.sendFile(__dirname + '/views/client_page.html')
            }

            else {
                res.sendFile(__dirname + '/views/forbidden.html')
            }
        }
    })
})

app.post('/api/announcements', function(req, res) {
    utils.postAnnouncements(req.body)
    res.sendFile(__dirname + '/views/client_page.html')
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
