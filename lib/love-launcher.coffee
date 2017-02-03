module.exports =

  activate: ->
    atom.commands.add "atom-text-editor", "love-launcher:launch", => @launch()
    @warned = 0

  launch: ->

    if atom.config.get("love-launcher.saveonlaunch")
      atom.workspace.saveAll()

    projectPaths = atom.project.getPaths()

    if projectPaths.length is 0
      window.alert( "No projects open!" )
      return

    basedir = projectPaths[0]

    currentFilePath = atom.workspace.getActivePaneItem()?.buffer?.file?.path
    for projectPath in projectPaths
      if currentFilePath?.slice(0, projectPath.length) == projectPath
        basedir = projectPath

    basedir += "/" + atom.config.get("love-launcher.lovemainpath")
    lovepath = atom.config.get("love-launcher.lovepath")
    loveopts = atom.config.get("love-launcher.loveopts")

    {BufferedProcess} = require "atom"
    command = lovepath
    args = [basedir, loveopts]
    cwd = basedir
    options = {cwd}
    stdout = (output) -> console.log(output)
    exit = (code) -> console.log("exited with #{code}")
    console.log("#{command} #{args}")
    process = new BufferedProcess({command, args, options, stdout, exit})
