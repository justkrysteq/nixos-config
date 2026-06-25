----------------
--- MONITORS ---
----------------

-- See https://wiki.hypr.land/Configuring/Monitors/
hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@144",
	position = "0x0",
	scale = 1
})

hl.monitor({
	output = "LG Electronics LG TV 0x01010101",
	mode = "preferred",
	position = "auto",
	mirror = "eDP-1",
	scale = "auto"
})
