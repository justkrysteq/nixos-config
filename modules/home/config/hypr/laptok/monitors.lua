----------------
--- MONITORS ---
----------------

MONITOR_BUILTIN = "eDP-1"
MONITOR_MAIN = "desc: Ancor Communications Inc ASUS VX239 FCLMTJ036594"
MONITOR_RIGHT = "desc: ASUSTek COMPUTER INC VZ239 L8LMRS013688"

-- See https://wiki.hypr.land/Configuring/Monitors/
hl.monitor({
	output = MONITOR_BUILTIN,
	mode = "1920x1080@144",
	position = "auto-left",
	scale = 1
})

hl.monitor({
	output = MONITOR_MAIN,
	mode = "1920x1080@60",
	position = "auto",
	scale = 1
})

hl.monitor({
	output = MONITOR_RIGHT,
	mode = "1920x1080@60",
	position = "auto-right",
	scale = 1
})

for i = 1, 10 do
	hl.workspace_rule({ workspace = "" .. i + 20, monitor = MONITOR_BUILTIN })
	hl.workspace_rule({ workspace = "" .. i + 0, monitor = MONITOR_MAIN })
	hl.workspace_rule({ workspace = "" .. i + 10, monitor = MONITOR_RIGHT })
end
