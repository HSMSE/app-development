const express = require('express')
const app = express()

const path = require('path')

app.use(express.static('public'))

//app.get('/', (req, res) => res.sendFile(path.join(__dirname + '/index.html')))

app.listen(3005, () => console.log('Listening port 3005'))
