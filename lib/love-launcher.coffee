module.exports =
  config:
    lovepath:
      title: 'LÖVE PATH'
      description: 'Path to LÖVE executable'
      type: 'string'
      default: 'C:\\Program Files (x86)\\LOVE\\love.exe'
    loveopts:
      title: 'LÖVE Options'
      description: 'Additional command-line options to pass to LÖVE'
      type: 'string'
      default: ''

  activate: ->
    atom.commands.add 'atom-text-editor', 'love-launcher:launch', => @launch()
    @warned = 0

  launch: ->
    projectPaths = atom.project.getPaths()

    if projectPaths.length is 0
      window.alert( "No projects open!" )
      return

    if projectPaths.length isnt 1 and @warned is 0
      window.alert( "More than one project is open! Assuming the first one has main.lua.\n\nIf this is not the case please reorder your projects." )
      @warned = 1

    basedir = projectPaths[0]
    lovepath = atom.config.get("love-launcher.lovepath")
    loveopts = atom.config.get("love-launcher.loveopts")

    {BufferedProcess} = require 'atom'
    command = lovepath
    args = [basedir, loveopts]
    stdout = (output) -> console.log(output)
    exit = (code) -> console.log("exited with #{code}")

    console.log("#{command} #{args}")
    process = new BufferedProcess({command, args, stdout, exit})
