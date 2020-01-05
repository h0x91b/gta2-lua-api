# gta2-lua-api

Lua API for controlling gta2.

## Installation

* Download release or compile this project by yourself using Visual Studio 2019.
* Copy `dinput8.dll`, `gta.dll`, `api.lua` and `lua51.dll` from `MFCLuaDll/Release/` folder into GTA 11.44 installation folder.
* Make new directory `scripts` in GTA directory.
* Copy `MFCLuaDll.asi` and `script.lua` in `GTA/scripts/` folder

Then you can run gta, you should see new window with `Load script` button.

## Compilation

TBD

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
```` 

### api.SetGameStatus(status)

Set game status to `status`, `status` can be `api.GAME_PAUSED` eg. 2 and `api.GAME_RUN` eg. 1

Example:

```lua
api.SetGameStatus(api.GAME_PAUSED)
```` 