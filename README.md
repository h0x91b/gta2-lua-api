# gta2-lua-api

Lua API for controlling gta2.

## Installation

* Download release or compile this project by yourself using Visual Studio 2019.
* Copy `dinput8.dll`, `gta.dll` and `lua-5.3.5.dll` from `MFCLuaDll/Release/` folder into GTA 11.44 installation folder.
* Make new directory `scripts` in GTA directory.
* Copy `MFCLuaDll.asi` and `script.lua` in `GTA/scripts/` folder

Then you can run gta, you should see new window with `Load script` button.

## API

gta.dll - is lua module, should be located in root of GTA installation.

```lua
local gta = require("gta")
````

### gta.read_memory(src, size)

* src - pointer to memory
* size - size of memory

returns:

* success - boolean
* memory - binary string, use string.pack/string.unpack to deal with it, in case of success false, there will be an error string

### gta.write_memory(dest, src)

* dest - pointer to memory
* src - binary string, use string.pack to make it.

returns:

* success - boolean
* memory - modified memory, in case of success false, there will be an error string

