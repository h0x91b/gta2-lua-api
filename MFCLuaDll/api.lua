local api = {}
local gta = require("gta")

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