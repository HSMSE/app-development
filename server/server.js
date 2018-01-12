const express = require("express")
const app = express()
const path = require("path")
const bodyParser = require('body-parser')

const keys = require('./keys.json')
const verifier = require('google-id-token-verifier')

const util = require('./util/util.js')
const db = require('./db.js')

app.use(express.static(__dirname + '/static'))
app.use(bodyParser.json())

//util
var emails = util.getAuthorizedEmails()

//mongoDB


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
            res.status(401)
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
