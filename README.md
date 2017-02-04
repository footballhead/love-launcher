LÖVE Launcher
===============================================================================

Launches a [LÖVE](http://love2d.org/) process for the current project.

The command is **Love Launcher: Launch**; the keyboard shortcut is `Alt+L`.

You can change which LÖVE process is spawned by going to
_Settings->Love Launcher_ and changing **LÖVE PATH**; the default is
`C:\Program Files (x86)\LOVE\love.exe`. If you're on Linux and have installed
LÖVE via a package manager then you can change **LÖVE PATH** to simply be
`love`.

You can also change which options LÖVE launches with; go to
_Settings->Love Launcher_ and change **LÖVE Options**. For example, this is
where you can specifiy `--console`.

If `main.lua` is not in the root of your project then you'll need to specifiy
the subdirectory (relative to the root) in the **LÖVE Main.lua Path** setting.

If you wish to save all files on launch then check the **Save On Launch**
setting. This is **off** by default.

If something isn't working be sure to check the console; that's where debug
info is dumped. All bug reports are welcome!
