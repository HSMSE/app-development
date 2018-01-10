const express = require("express")
const app = express()
const path = require("path")
const bodyParser = require('body-parser')

const keys = require('./keys.json')
const verifier = require('google-id-token-verifier')

const PythonShell = require('python-shell')

app.use(express.static(__dirname + '/static'))
app.use(bodyParser.json())

//util
var emails = []

PythonShell.run('util/emails.py', function (err, results) {
    if (err) throw err
    emails = results

    console.log("Authorized emails:")
    for(let i = 0; i < emails.length; i++) {
        emails[i] = emails[i].slice(0, emails[i].length - 1)
        console.log(emails[i])
    }
    emails.push('benkosten@gmail.com')
})

//announcement view
app.get('/',function(req,res) {
    res.sendFile(path.join(__dirname + '/static/index.html'))
})

//handle signin
app.post('/g-signin', function(req, res) {
    var g_token = req.body['token']
    verifier.verify(g_token, keys['web']['client_id'], function (err, tokenInfo) {
        if (!err) {
            if(emails.includes(tokenInfo['email'])) {
                console.log(tokenInfo)
            }
        }
        else {
            res.status(401).end()
        }
    })

})

//Api Routing
app.get('/api/announcements', function(req, res) {
    res.status(200).json('{timestamp: stuff}')
})

// Starts the server.
app.listen(3000, function() {
    console.log('Starting server on port 3000')
});
