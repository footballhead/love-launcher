module.exports =
  configDefaults:
    lovepath: "C:\\Program Files (x86)\\LOVE\\love.exe"
    loveopts: ""

  activate: ->
    atom.workspaceView.command "love-launcher:launch", => @launch()

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
