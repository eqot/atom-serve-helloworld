
server = null

module.exports =
  activate: ->
    atom.workspaceView.command "serve-helloworld:start", => @start()
    atom.workspaceView.command "serve-helloworld:stop", => @stop()

  start: ->
    editor = atom.workspace.activePaneItem
    text = editor.getText()

    http = require 'http'
    server = http.createServer (req, res) =>
      res.writeHead 200, {'Content-Type': 'text/plain'}
      res.end text
    server.listen 8000, '127.0.0.1'

    console.log('Server started.')

  stop: ->
    if server isnt null
      server.close()
      server = null

    console.log('Server sopped.')
