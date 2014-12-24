{WorkspaceView, Workspace, Editor} = require 'atom'
RunCommand = require '../lib/run-command'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "RunCommand", ->
  activationPromise = null

  beforeEach ->
    activationPromise = atom.packages.activatePackage('run-command')

  xit "will eventually have tests"
