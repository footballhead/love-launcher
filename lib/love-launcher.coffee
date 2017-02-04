module.exports =

  activate: ->
    atom.commands.add "atom-text-editor", "love-launcher:launch", => @launch()
    @warned = 0

  launch: ->

    atom.workspace.saveAll() if atom.config.get("love-launcher.saveonlaunch")

    projectPaths = atom.project.getPaths()

    if projectPaths.length is 0
      window.alert( "No projects open!" )
      return

    currentFilePath = atom.workspace.getActivePaneItem()?.buffer?.file?.path
    for projectPath in projectPaths
      if currentFilePath?.slice(0, projectPath.length) == projectPath
        basedir = projectPath

    basedir += "/" + atom.config.get("love-launcher.lovemainpath")
    lovepath = atom.config.get("love-launcher.lovepath")
    loveopts = atom.config.get("love-launcher.loveopts")

    command = lovepath
    args = [basedir, loveopts]
    options = {detached: true, stdio: "inherit"}
    console.log("command:#{command} args:#{args}")
    child = require("child_process")
    process = child.spawn(command, args, options)
