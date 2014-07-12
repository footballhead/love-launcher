module.exports =
  activate: ->
    atom.workspaceView.command "love-launcher:launch", => @launch()

  launch: ->
    projroot = atom.project.getRootDirectory()
    basedir = projroot.getRealPathSync()

    {BufferedProcess} = require 'atom'
    command = 'C:\\Program Files (x86)\\LOVE\\love.exe'
    args = [basedir]
    stdout = (output) -> console.log(output)
    exit = (code) -> console.log("exited with #{code}")
    process = new BufferedProcess({command, args, stdout, exit})
