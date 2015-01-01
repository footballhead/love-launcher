LÖVE Launcher
===============================================================================

Launches a [LÖVE](http://love2d.org/) process for the current project.

`main.lua` needs to be in the project root.

The command is **Love Launcher: Launch**; the keyboard shortcut is `Alt+L`.

You can change which LÖVE process is spawned by going to
_Settings->Love Launcher_ and changing **Lovepath**; the default is
`C:\Program Files (x86)\LOVE\love.exe`. If you're on Linux and have installed
LÖVE via a package manager then you can change **Lovepath** to simply be
`love`.

You can also change which options LÖVE launches with; go to
_Settings->Love Launcher_ and change **Loveopts**.

If something isn't working be sure to check the console; that's where debug
info is dumped.
