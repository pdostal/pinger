express  = require 'express'
moment = require 'moment'
app = express()

app.get '/', (req, res) ->
  res.render 'index.ejs'
  console.log moment().format('hh:mm:ss')+' /'

server = app.listen 9292, ->
  console.log 'Listening on %s', server.address().port
