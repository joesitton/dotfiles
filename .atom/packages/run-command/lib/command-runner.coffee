{BufferedProcess} = require 'atom'
Utils = require './utils'

class CommandRunner
  processor: BufferedProcess
  commandResult: ''

  constructor: (command, callback)->
    @command = command
    @callback = callback

  collectResults: (output) =>
    @commandResult += output.toString()
    @returnCallback()

  exit: (code) =>
    @returnCallback()

  processParams: ->
    command: '/bin/bash'
    args: ['-c', @addPrecedentCommand(@command)]
    options:
      cwd: atom.project.getPath()
    stdout: @collectResults
    stderr: @collectResults
    exit: @exit

  returnCallback: =>
    @callback(@command, @commandResult)

  runCommand: ->
    @commandResult = ''
    @process = new @processor @processParams()
    @returnCallback()

  kill: ->
    if @process?
      @process.kill()

  addPrecedentCommand: (command)=>
    precedent = atom.config.get 'run-command.precedeCommandsWith'

    if precedent? and !Utils.stringIsBlank(precedent)
      @joinCommands [precedent, command]

  joinCommands: (commands)=>
    commands.join(' && ')

module.exports =
  CommandRunner: CommandRunner
