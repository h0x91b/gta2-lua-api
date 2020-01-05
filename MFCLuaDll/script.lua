log("Script.lua")
local api = require "api"
local gta = require "gta"

-- log("NextPedId is ".. api.GetNextPedId())
-- log(api.IncrByNextPedId(1000))

log("test ffi")

local ffi = require("ffi")

log("require ffi ok")

ffi.cdef[[
int __cdecl HelloFFI(int, int, int);

typedef enum GAME_STATUS {
    GAME_PAUSED=2,
    GAME_RUN=1
} GAME_STATUS;

typedef struct {
    enum GAME_STATUS gameStatus;
    void * slots[6];
    int alsoCurrentSlot;
    char field_0x20;
    char slotIndex;
    int field_0x24;
    int field_0x28;
    int field_0x2c;
    void * currentSlot;
} Game;

Game* __cdecl getGame();

]]

local theDll = ffi.load("gta")
log("dll is loaded")
local res = tonumber(theDll.HelloFFI(1, 2, 3))
log("1 + 2 + 3 = " .. res)

log("getGame");

local p = ffi.cast( "Game**", 0x005eb4fc )
log( tostring(p) )
log( tostring(p[0]) )
log( tostring(p[0].currentSlot) )


log("finish")

return 42
