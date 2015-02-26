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

  launch: ->
    projroot = atom.project.getRootDirectory()
    basedir = projroot.getRealPathSync()
    lovepath = atom.config.get("love-launcher.lovepath")
    loveopts = atom.config.get("love-launcher.loveopts")

    {BufferedProcess} = require 'atom'
    command = lovepath
    args = [basedir, loveopts]
    stdout = (output) -> console.log(output)
    exit = (code) -> console.log("exited with #{code}")

    console.log("#{command} #{args}")
    process = new BufferedProcess({command, args, stdout, exit})
