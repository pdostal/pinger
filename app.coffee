express  = require 'express'
moment = require 'moment'
app = express()

app.get '/', (req, res) ->
  res.send 'Hello World !\n'
  console.log moment().format('hh:mm:ss')+' /'

app.listen 9292, ->
  console.log "Listening on port 9292 ..."
