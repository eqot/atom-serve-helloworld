module.exports =
  activate: ->
    atom.workspaceView.command "serve-helloworld:serve", => @serve()

  serve: ->
    editor = atom.workspace.activePaneItem
    # selection = editor.getSelection()
    # selection.insertText("Hello World!")

    http = require 'http'
    server = http.createServer (req, res) =>
      res.writeHead 200, {'Content-Type': 'text/plain'}
      res.end 'Hello World!\n'
    server.listen 8000, '127.0.0.1'
