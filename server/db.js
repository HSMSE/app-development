const keys = require('./keys.json')
const mongoose = require('mongoose')

var promise = mongoose.connect(keys['mongo_uri'], {
  useMongoClient: true,
  /* other options */
})
var db = mongoose.connection

db.on('error', console.error.bind(console, 'connection error:'))
db.once('open', function() {
    console.log("Connected to DB")
})

module.exports = {
    init: function() {
        return 0
    }
}
