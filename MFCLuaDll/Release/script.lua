log("Hello world")
local gta = require "gta"

function GetNextPedId()
	local r, mem = gta.read_memory(0x00591e84, 4)
	if r then
		return string.unpack("L", mem)
	end
	return -1
end

function IncrByNextPedId( incr )
	local pedId = GetNextPedId();
	if pedId ~= -1 then
		pedId = pedId + incr
		gta.write_memory(0x00591e84, string.pack("L", pedId))
	end
	return GetNextPedId();
end

log("gta is loaded")
log(gta.hello())
log("NextPedId is "..GetNextPedId())
log(IncrByNextPedId(1000))

return 42
