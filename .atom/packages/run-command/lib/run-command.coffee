RunCommandView = require './run-command-view'
CommandRunnerView = require './command-runner-view'

module.exports =
  configDefaults:
    precedeCommandsWith: 'source $HOME/.bash_profile'
    snapCommandResultsToBottom: true

  runCommandView: null
  commandRunnerView: null

  activate: (state) ->
    @commandRunnerView = new CommandRunnerView()
    @runCommandView = new RunCommandView(@commandRunnerView)

  deactivate: ->
    @runCommandView.destroy()
    @commandRunnerView.destroy()

  serialize: ->
    runCommandViewState: @runCommandView.serialize()
