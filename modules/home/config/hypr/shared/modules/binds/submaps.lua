---------------
--- SUBMAPS ---
---------------

-- SECTION: RESIZE

hl.bind("SUPER + R", hl.dsp.submap("resize"), { desc = "Enter a resize submap, [R]esize" })

hl.define_submap("resize", function()
	hl.bind("left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true, desc = "Resize window left" })
	hl.bind("up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true, desc = "Resize window up" })
	hl.bind("down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true, desc = "Resize window down" })
	hl.bind("right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true, desc = "Resize window right" })

	hl.bind("h", hl.dsp.window.resize({ x = -30, y = 0, relative = true }), { repeating = true, desc = "Resize window left" })
	hl.bind("k", hl.dsp.window.resize({ x = 0, y = -30, relative = true }), { repeating = true, desc = "Resize window up" })
	hl.bind("j", hl.dsp.window.resize({ x = 0, y = 30, relative = true }), { repeating = true, desc = "Resize window down" })
	hl.bind("l", hl.dsp.window.resize({ x = 30, y = 0, relative = true }), { repeating = true, desc = "Resize window right" })

	hl.bind("escape", hl.dsp.submap("reset"), { desc = "Quit submap" })
end)

-- SECTION: MOVE

hl.bind("SUPER + SHIFT + R", hl.dsp.submap("move"), { desc = "Enter a move submap" })

hl.define_submap("move", function()
	hl.bind("left", hl.dsp.window.move({ x = -10, y = 0, relative = true }), { repeating = true, desc = "Move window left" })
	hl.bind("up", hl.dsp.window.move({ x = 0, y = -10, relative = true }), { repeating = true, desc = "Move window up" })
	hl.bind("down", hl.dsp.window.move({ x = 0, y = 10, relative = true }), { repeating = true, desc = "Move window down" })
	hl.bind("right", hl.dsp.window.move({ x = 10, y = 0, relative = true }), { repeating = true, desc = "Move window right" })

	hl.bind("h", hl.dsp.window.move({ x = -30, y = 0, relative = true }), { repeating = true, desc = "Move window left" })
	hl.bind("k", hl.dsp.window.move({ x = 0, y = -30, relative = true }), { repeating = true, desc = "Move window up" })
	hl.bind("j", hl.dsp.window.move({ x = 0, y = 30, relative = true }), { repeating = true, desc = "Move window down" })
	hl.bind("l", hl.dsp.window.move({ x = 30, y = 0, relative = true }), { repeating = true, desc = "Move window right" })

	hl.bind("escape", hl.dsp.submap("reset"), { desc = "Quit submap" })
end)
