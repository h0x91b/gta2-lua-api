log("Hello world")
local gta = require "scripts/gta"

log("gta is loaded")
log("foo " .. gta.foo)
log(gta.hello())

return 42
