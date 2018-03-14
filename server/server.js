const express = require("express")
const app = express()
const path = require("path")
const bodyParser = require('body-parser')

const low = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')
const adapter = new FileSync('announcements.json')
const db = low(adapter)

const keys = require('./keys.json')
const verifier = require('google-id-token-verifier')

const utils = require('./utils/utils.js')

//db setup
db.defaults({announcements: []}).write()

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

app.get('/test', function(req, res) {
    db.get('announcements')
        .push({date: req.query["date"], subject: req.query["subject"], message: req.query["message"]})
        .write()

    res.json(req.query)
})

app.get('/api/announcements', function(req, res) {
    utils.getAnnouncements(function(err, fileData) {
        res.json(fileData)
    })
})

/*
Announcement Routing
Announcemnts will be in the format:
{"2012-04-23": [{"m": "Seniors pay prom deposits", "t": "Boylan", "s": "Prom"}, {"m": "Freshman don't be loud", "t": "Zara", "s": "Noise Complaint"}]}

m -> message
t -> teacher
s -> subject
d -> date

date format will be compliant with: https://stackoverflow.com/questions/10286204/the-right-json-date-format
yyyy-mm-dd

app.post('/api/announcements', function(req, res) {

    utils.postAnnouncements(req.body, function(err) {
        if(!err) {
            res.send(true)
        }
    })
})
*/

// Starts the server.
app.listen(3000, function() {
    console.log('Starting server on port 3000')
});
