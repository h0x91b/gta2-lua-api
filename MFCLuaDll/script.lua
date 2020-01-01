log("Script.lua")
local api = require "api"

log("NextPedId is ".. api.GetNextPedId())
log(api.IncrByNextPedId(1000))

return 42
