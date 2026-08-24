----------------
--- MONITORS ---
----------------

-- See https://wiki.hypr.land/Configuring/Monitors/

local monitor1 = "HDMI-A-1"
local monitor2 = "DP-2"

hl.monitor({
	output = monitor1,
	mode = "1920x1080@60",
	position = "0x0",
	scale = 1
})

hl.monitor({
	output = monitor2,
	mode = "1920x1080@60",
	position = "1920x0",
	scale = 1
})

for i = 1, 10 do
	hl.workspace_rule({ workspace = "" .. i, monitor = monitor1 })
	hl.workspace_rule({ workspace = "" .. i + 10, monitor = monitor2 })
end
