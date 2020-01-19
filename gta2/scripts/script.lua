log("Script.lua")
local api = require "api"
local gta = require "gta"

log("NextPedId is ".. api.GetNextPedId())
log(api.IncrByNextPedId(1000))

log("test ffi")

local res, txt = api.GetGameStatus()
log("Game status: code: " .. tostring(res) .. " text: " .. txt)

log("Pause the game")
api.SetGameStatus(api.GAME_PAUSED)

log("api.GetPedById(1)")
local ped = api.GetPedById(1)
log("Player ped: " .. tostring(ped))
if ped ~= 0 then
	log("Player health: " .. tostring(ped.health))
	ped.health = 20
end

function BeginScene( dt )
	-- log("BeginScene " .. tostring(dt))
	local ped = api.GetPedById(1)
	if ped ~= 0 then
		ped.health = 100
	end
end

api.HookBeginScene(BeginScene)

log("finish")

return 42
