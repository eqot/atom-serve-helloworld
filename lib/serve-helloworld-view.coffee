{View} = require 'atom'

module.exports =
class ServeHelloworldView extends View
  @content: ->
    @div class: 'serve-helloworld overlay from-top', =>
      @div "The ServeHelloworld package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "serve-helloworld:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "ServeHelloworldView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
