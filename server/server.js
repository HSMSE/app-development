const express = require("express")
const app = express()
const path = require("path")
const bodyParser = require('body-parser')

const keys = require('./keys.json')
const verifier = require('google-id-token-verifier')

const utils = require('./utils/utils.js')

//express setup
app.use(express.static(__dirname + '/static'))
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())


//handle signin
app.post('/g-signin', function(req, res) {
    var g_token = req.body['token']
    verifier.verify(g_token, keys['web']['client_id'], function (err, tokenInfo) {
        if (!err) {

            console.log(tokenInfo)
        }
    })
})

app.get('/client_page', function(req, res) {
    res.sendFile(__dirname + '/views/client_page.html')
})

app.post('/api/announcements', function(req, res) {
    utils.postAnnouncements(req.body)
    res.redirect('/client_page')
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
