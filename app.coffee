http = require('http')
moment = require('moment')

http.createServer (req, res) ->
  res.writeHead 200
  res.write "Hello World !\n"

  req.on 'end', ->
    console.log moment().format('hh:mm:ss')+' '+req.url

  res.end()
.listen 9292

console.log "Server's running..."
