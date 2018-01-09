var express = require("express");
var app = express();
var path = require("path");

app.use(express.static(__dirname + '/static'));

//Announcement View
app.get('/',function(req,res) {
    res.sendFile(path.join(__dirname + '/static/index.html'))
})

//Api Routing
app.get('/api/announcements', function(req, res) {
    res.status(200).json('{timestamp: stuff}')
})

// Starts the server.
app.listen(3000, function() {
    console.log('Starting server on port 3000');
});
