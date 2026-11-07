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

local wr_signal = hl.window_rule({
	name = "signal-on-w-3",
	match = {
		class = "signal",
	},
	workspace = "3",
	group = "set"
})

local wr_vesktop = hl.window_rule({
	name = "vesktop-on-w-3",
	match = {
		class = "vesktop",
	},
	workspace = "3",
	group = "set"
})

local wr_signal_dual = hl.window_rule({
	name = "signal-on-w-13",
	enabled = false,
	match = {
		class = "signal",
	},
	workspace = "13"
})

local wr_vesktop_dual = hl.window_rule({
	name = "vesktop-on-w-11",
	enabled = false,
	match = {
		class = "vesktop",
	},
	workspace = "11"
})

hl.on("monitor.added", function(monitor)
	if monitor == hl.get_monitor(MONITOR_MAIN) then
		hl.dispatch(hl.dsp.focus({ workspace = "1" }))

		for i = 1, 10 do
			hl.workspace_rule({ workspace = "" .. i + 20, monitor = MONITOR_BUILTIN })
			hl.workspace_rule({ workspace = "" .. i + 0, monitor = MONITOR_MAIN })
		end
	elseif monitor == hl.get_monitor(MONITOR_RIGHT) then
		for i = 1, 10 do
			hl.workspace_rule({ workspace = "" .. i + 10, monitor = MONITOR_RIGHT })
		end

		wr_signal:set_enabled(false)
		wr_signal_dual:set_enabled(true)

		wr_vesktop:set_enabled(false)
		wr_vesktop_dual:set_enabled(true)
	end
end)

hl.on("monitor.removed", function(monitor)
	if monitor == hl.get_monitor(MONITOR_RIGHT) then
		wr_signal:set_enabled(true)
		wr_signal_dual:set_enabled(false)

		wr_vesktop:set_enabled(true)
		wr_vesktop_dual:set_enabled(false)
	end
end)
