module.exports =
  configDefaults:
    lovepath: "C:\\Program Files (x86)\\LOVE\\love.exe"

  activate: ->
    atom.workspaceView.command "love-launcher:launch", => @launch()

  launch: ->
    projroot = atom.project.getRootDirectory()
    basedir = projroot.getRealPathSync()
    lovepath = atom.config.get("love-launcher.lovepath")

    {BufferedProcess} = require 'atom'
    command = lovepath
    args = [basedir]
    stdout = (output) -> console.log(output)
    exit = (code) -> console.log("exited with #{code}")

    console.log("#{command} #{args}")
    process = new BufferedProcess({command, args, stdout, exit})
