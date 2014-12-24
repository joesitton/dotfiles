{BufferedProcess} = require 'atom'
{CommandRunner}   = require '../lib/command-runner'

describe "CommandRunner", ->

  beforeEach ->
    @callback = jasmine.createSpy 'callback'
    @runner   = new CommandRunner 'echo Hello World', @callback

  describe "::processParams", ->
    it "contains a parameters object", ->
      object =
        command: '/bin/bash'
        args: ['-c', atom.config.get 'run-command.precedeCommandsWith' + ' && ' + @runner.command]
        options:
          cwd: atom.project.getPath()
        stdout: @runner.collectResults
        stderr: @runner.collectResults
        exit: @runner.exit
      expect(@runner.processParams()).toEqual object

  describe "::collectResults", ->
    it "appends the given arguments to ::commandResult", ->
      result = "Hello World"
      @runner.collectResults result
      expect(@runner.commandResult).toEqual result

    it "invokes ::returnCallback", ->
      spyOn @runner, 'returnCallback'
      @runner.collectResults ''
      expect(@runner.returnCallback).toHaveBeenCalled()

  describe "::run", ->
    it "creates a BufferedProcess", ->
      spyOn @runner, 'processor'
      @runner.runCommand()
      expect(@runner.processor).toHaveBeenCalledWith @runner.processParams()

    it "resets the ::commandResult string", ->
      @runner.commandResult = "Goodbye World"
      @runner.runCommand()
      expect(@runner.commandResult).toEqual ''

    it "invokes ::returnCallback", ->
      spyOn @runner, 'returnCallback'
      @runner.runCommand()
      expect(@runner.returnCallback).toHaveBeenCalled()

  describe "::exit", ->
    it "invokes ::returnCallback", ->
      spyOn @runner, 'returnCallback'
      @runner.exit()
      expect(@runner.returnCallback).toHaveBeenCalled()

  describe "::returnCallback", ->
    it "invokes ::callback with ::command and ::commandResult", ->
      @runner.returnCallback()
      expect(@callback).toHaveBeenCalledWith @runner.command,
        @runner.commandResult
