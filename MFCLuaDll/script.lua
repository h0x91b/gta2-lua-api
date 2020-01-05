log("Script.lua")
local api = require "api"
local gta = require "gta"

-- log("NextPedId is ".. api.GetNextPedId())
-- log(api.IncrByNextPedId(1000))

log("test ffi")

local res, txt = api.getGameStatus()
log("Game status: code: " .. tostring(res) .. " text: " .. txt)

log("Pause the game")
api.setGameStatus(api.GAME_PAUSED)

log("finish")

return 42
