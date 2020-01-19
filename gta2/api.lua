local api = {
	GAME_PAUSED=2,
    GAME_RUN=1,
}
local gta = require("gta")
local ffi = require("ffi")

ffi.cdef[[
int __cdecl HelloFFI(int, int, int);

typedef void* (__stdcall GetPedById)(int);

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
local pGetPedById = ffi.cast("GetPedById*", 0x0043ae10)


function api.GetGameStatus()
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

function api.SetGameStatus( status )
	if status ~= 1 and status ~= 2 then
		return
	end
	if api.GetGameStatus() ~= 0 then
		pGame[0].gameStatus = status
	end
end

function api.GetNextPedId()
	local p = ffi.cast("int*", 0x00591e84)
	return p[0]
end

function api.IncrByNextPedId( incr )
	local p = ffi.cast("int*", 0x00591e84)
	p[0] = p[0] + incr
	return p[0];
end

function api.GetPedById( id )
	log("api.GetPedById( " .. tostring(id) .. ") " .. tostring(pGetPedById))
	local ped = pGetPedById(id)
	return ped
end

return api