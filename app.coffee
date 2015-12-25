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
  res.render 'index.ejs'
  console.log moment().format('hh:mm:ss')+' /'

server = app.listen 9292, ->
  console.log 'Listening on %s', server.address().port
  list.forEach (item, i) ->
    result4 = ping4(item.address)
    result6 = ping6(item.address)
    console.log "#{item.name}: #{result4} #{result6}"
