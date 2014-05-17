module.exports =
  activate: ->
    atom.workspaceView.command "serve-helloworld:serve", => @serve()

  serve: ->
    editor = atom.workspace.activePaneItem
