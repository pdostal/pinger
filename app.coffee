express  = require 'express'
moment = require 'moment'
shell = require 'shelljs'
fs = require 'fs'
app = express()

shell.config.silent = true
shell.config.fatal = false

ping6 = (host) ->
  if host
    shell.exec('fping6 ' + host).code
  else
    ''

ping4 = (host) ->
  if host
    shell.exec('fping ' + host).code
  else
    ''

list = JSON.parse fs.readFileSync 'list.json'

app.get '/', (req, res) ->
  console.log moment().format('hh:mm:ss')+' /'
  res.render 'index.ejs'

server = app.listen 9292, ->
  console.log 'Listening on %s', server.address().port
