----------------
--- GESTURES ---
----------------

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.gesture({
	fingers = 3,
	direction = "up",
	action = function()
		hl.dispatch(hl.dsp.group.prev())
	end
})

hl.gesture({
	fingers = 3,
	direction = "down",
	action = function()
		hl.dispatch(hl.dsp.group.next())
	end
})
