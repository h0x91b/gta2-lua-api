# gta2-lua-api

Lua API for controlling gta2.

## Compilation

### Compiling

You will need visual studio 2019.

Clone or download this project somewhere, then open in `Visual Studio 2019` `gta2-lua-api\MFCLuaDll\MFCLuaDll.sln`
Then just compile, everything should work fine.

### Manual compile of LuaJIT

You will need visual studio 2019.

* Download [LuaJIT](http://luajit.org/download.html)
* Make directory `C:\Lua\`
* Unpack into `C:\Lua\LuaJIT-2.0.5\` lua source code
* Open `Visual Studio 2019 Developer Command Prompt`
* Compile source:

```
cd C:\Lua\LuaJIT-2.0.5\src

msvcbuild
```

Copy from `C:\Lua\LuaJIT-2.0.5\src` into `C:\Lua` following files:

* luajit.exe
* lua51.dll
* lua51.lib

## Installation

* Download release or compile this project by yourself using Visual Studio 2019.
* Copy all files from this project [gta2](gta2/) directory into GTA 2 11.44 installation folder.

Then you can run gta, you should see new window with `Load script` button.

## API

* gta.dll - is low level lua module, should be located in root of GTA installation.
* api.lua - high level API written on LUA, you should use it most times, should be located in root of GTA installation.

```lua
local gta = require("gta")
local api = require("api")
```

### api.GetNextPedId()

Return `PedId` of next created ped

### api.IncrByNextPedId( incr )

Increment once next `PedId` by `incr`

### api.GetGameStatus()

Returns `Code`, `TextStatus`

Example:

```lua
local code, txt = api.GetGameStatus()
log("Game status: code: " .. tostring(code) .. " text: " .. txt)
```

### api.SetGameStatus(status)

Set game status to `status`, `status` can be `api.GAME_PAUSED` eg. 2 and `api.GAME_RUN` eg. 1

Example:

```lua
api.SetGameStatus(api.GAME_PAUSED)
```

### api.GetPedById( id )

Return pointer to `Ped` with requested id

Example:

```lua
-- get player ped and show his current health, then set health to 20
local ped = api.GetPedById(1)
if ped ~= 0 then
	log("Player health: " .. tostring(ped.health))
	ped.health = 20
end
```

### api.HookBeginScene( fn )

Set hook to your function which will be called before every `BeginScene` e.g. before drawing frame

To callback `dt` will be passed as first argument, `dt` is delta time in seconds from previous drawFrame, you can use it to make physics.

Example:

```lua
-- Set health to 100% on each frame draw, so cops will can not kill you
-- dt - is time in seconds from previous draw
function BeginScene( dt )
	-- log("BeginScene " .. tostring(dt))
	local ped = api.GetPedById(1)
	if ped ~= 0 then
		ped.health = 100
	end
end

api.HookBeginScene(BeginScene)
```

### Ped struct

All definitions are in [Ped.h](MFCLuaDll/reversed/ped.h) and in [api.lua](gta2/api.lua)