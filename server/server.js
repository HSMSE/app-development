var express = require("express");
var app = express();
var path = require("path");

app.use('/static', express.static(__dirname + '/static'));

//Announcement View
app.get('/',function(req,res){
    res.sendFile(path.join(__dirname+'/views/index.html'))
})

//Api Routing

// Starts the server.
app.listen(3000, function() {
  console.log('Starting server on port 3000');
});
