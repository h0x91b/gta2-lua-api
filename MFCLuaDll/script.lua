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
]]

local theDll = ffi.load("gta")
log("dll is loaded")
local res = tonumber(theDll.HelloFFI(1, 2, 3))
log("1 + 2 + 3 = " .. res)

log("finish")

return 42
