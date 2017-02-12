LÖVE Launcher
===============================================================================

Launches a [LÖVE](http://love2d.org/) process for the current project.

Usage
-------------------------------------------------------------------------------

1. Open a Project Folder (_File > Open Folder_)
2. Open a file (e.g. `main.lua`)
3. Press **ALT + L**. Alternatively, open the Command Palette and find
**Love Launcher: Launch**.

Settings
-------------------------------------------------------------------------------

**LÖVE PATH**: The location of the LÖVE binary on disk. The default is
`C:\Program Files (x86)\LOVE\love.exe`. This respects the `PATH` environment
variable. That means that if you're on Linux and have installed LÖVE via a
package manager then you can change **LÖVE PATH** to be `love`.

**LÖVE Options**: The command-line options given to the LÖVE process. For
example, this is where you can specify `--console` on Windows to launch a
debug console.

**LÖVE Main.lua Path**: The subdirectory of the current project that contains
`main.lua`. If not set then it's assumed to be in the current project's root.

**Save On Launch**: When on, all files will be saved when launching LÖVE. This
is **off** by default.

Debug/print() Output
-------------------------------------------------------------------------------

On Windows, add `--console` to the **LÖVE Options** setting. This will spawn a
separate console window. Alternatively, in v0.10.2+, modify **LÖVE PATH** to
run `lovec.exe` (instead of `love.exe`).

On Linux, all `print()` statements will go to the Atom Developer Console
(_View > Developer > Toggle Developer Tools_) **but only if the following is
run** (e.g. in `love.load()`):

```lua
io.stdout:setvbuf("no")
```

If something goes wrong with LÖVE launcher the error will be in the Developer
Console. All bug reports are welcome!
