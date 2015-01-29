express  = require 'express'
moment = require 'moment'
fs = require 'fs'
app = express()

list = JSON.parse fs.readFileSync 'list.json'
list.forEach (item, i) ->
  if i == 0 then process.stdout.write "Nodes "
  process.stdout.write "#{item.name} "
  if i+1 >= list.length then process.stdout.write "\n"

app.get '/', (req, res) ->
  res.render 'index.ejs'
  console.log moment().format('hh:mm:ss')+' /'

server = app.listen 9292, ->
  console.log 'Listening on %s', server.address().port
