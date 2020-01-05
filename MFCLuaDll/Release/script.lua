log("Script.lua")
local api = require "api"
local gta = require "gta"

log("NextPedId is ".. api.GetNextPedId())
log(api.IncrByNextPedId(1000))

return 42
