{WorkspaceView} = require 'atom'
ServeHelloworld = require '../lib/serve-helloworld'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "ServeHelloworld", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('serve-helloworld')

  describe "when the serve-helloworld:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.serve-helloworld')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'serve-helloworld:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.serve-helloworld')).toExist()
        atom.workspaceView.trigger 'serve-helloworld:toggle'
        expect(atom.workspaceView.find('.serve-helloworld')).not.toExist()
