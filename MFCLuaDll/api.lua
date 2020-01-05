local api = {}
local gta = require("gta")
local ffi = require("ffi")

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

]]

local pGame = ffi.cast( "Game**", 0x005eb4fc )

function api.getGameStatus()
	log(tostring(pGame))
	log(tostring(pGame[0]))
	if pGame[0] == nil then
		return 0, "GAME_NOT_STARTED"
	elseif pGame[0].gameStatus == 1 then
		return 1, "GAME_RUN"
	else
		return 2, "GAME_PAUSED"
	end
end


function api.GetNextPedId()
	local r, mem = gta.read_memory(0x00591e84, 4)
	if r then
		return string.unpack("L", mem)
	end
	return -1
end

function api.IncrByNextPedId( incr )
	local pedId = api.GetNextPedId();
	if pedId ~= -1 then
		pedId = pedId + incr
		gta.write_memory(0x00591e84, string.pack("L", pedId))
	end
	return api.GetNextPedId();
end

return api