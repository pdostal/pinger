http = require('http').createServer (req, res) ->
    res.writeHead 200
    res.write "Hello World"
    res.end
http.listen 4000

console.log "Server's running..."
