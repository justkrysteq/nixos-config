---------------
--- SUBMAPS ---
---------------

local map = function(key, action, desc)
	hl.bind(key, function()
		hl.dispatch(action)
		hl.dispatch(hl.dsp.submap("reset"))
	end, { desc = desc })
end

-- SECTION: RESIZE

hl.bind("SUPER + R", hl.dsp.submap("resize"), { desc = "Enter a resize submap, [R]esize" })

hl.define_submap("resize", function()
	hl.bind("left",   hl.dsp.window.resize({ x = -10, y = 0,   relative = true }), { repeating = true, desc = "Resize window left" })
	hl.bind("up",     hl.dsp.window.resize({ x = 0,   y = -10, relative = true }), { repeating = true, desc = "Resize window up" })
	hl.bind("down",   hl.dsp.window.resize({ x = 0,   y = 10,  relative = true }), { repeating = true, desc = "Resize window down" })
	hl.bind("right",  hl.dsp.window.resize({ x = 10,  y = 0,   relative = true }), { repeating = true, desc = "Resize window right" })

	hl.bind("h",      hl.dsp.window.resize({ x = -30, y = 0,   relative = true }), { repeating = true, desc = "Resize window left" })
	hl.bind("k",      hl.dsp.window.resize({ x = 0,   y = -30, relative = true }), { repeating = true, desc = "Resize window up" })
	hl.bind("j",      hl.dsp.window.resize({ x = 0,   y = 30,  relative = true }), { repeating = true, desc = "Resize window down" })
	hl.bind("l",      hl.dsp.window.resize({ x = 30,  y = 0,   relative = true }), { repeating = true, desc = "Resize window right" })

	hl.bind("escape", hl.dsp.submap("reset"), { desc = "Quit submap" })
end)

-- SECTION: MOVE

hl.bind("SUPER + SHIFT + R", hl.dsp.submap("move"), { desc = "Enter a move submap" })

hl.define_submap("move", function()
	hl.bind("left",   hl.dsp.window.move({ x = -10, y = 0,   relative = true }), { repeating = true, desc = "Move window left" })
	hl.bind("up",     hl.dsp.window.move({ x = 0,   y = -10, relative = true }), { repeating = true, desc = "Move window up" })
	hl.bind("down",   hl.dsp.window.move({ x = 0,   y = 10,  relative = true }), { repeating = true, desc = "Move window down" })
	hl.bind("right",  hl.dsp.window.move({ x = 10,  y = 0,   relative = true }), { repeating = true, desc = "Move window right" })

	hl.bind("h",      hl.dsp.window.move({ x = -30, y = 0,   relative = true }), { repeating = true, desc = "Move window left" })
	hl.bind("k",      hl.dsp.window.move({ x = 0, y = -30,   relative = true }), { repeating = true, desc = "Move window up" })
	hl.bind("j",      hl.dsp.window.move({ x = 0, y = 30,    relative = true }), { repeating = true, desc = "Move window down" })
	hl.bind("l",      hl.dsp.window.move({ x = 30, y = 0,    relative = true }), { repeating = true, desc = "Move window right" })

	hl.bind("escape", hl.dsp.submap("reset"), { desc = "Quit submap" })
end)

-- SECTION: WORKSPACE NAVIGATION

hl.bind("SUPER + Escape", hl.dsp.submap("workspace_navigation"), { desc = "Enter a workspace navigation submap" })

hl.define_submap("workspace_navigation", function()
	for i = 1, 10 do
		map(tostring(i % 10), function()
			local monitor_id = hl.get_active_monitor().id

			hl.dispatch(hl.dsp.focus({ workspace = 10*monitor_id + i }))
		end, "Focus workspace " .. i .. " on the current monitor")
	end
end)

-- SECTION: MONITOR NAVIGATION

hl.bind("SUPER + SHIFT + Escape", hl.dsp.submap("monitor_navigation"), { desc = "Enter a monitor navigation submap" })

hl.define_submap("monitor_navigation", function()
	for i = 1, 10 do
		map(tostring(i % 10), hl.dsp.focus({ monitor = i - 1 }), "Focus monitor with id " .. i - 1)
	end
end)

-- SECTION: GROUP MANAGEMENT

hl.bind("SUPER + G", hl.dsp.submap("group_management"), { desc = "Enter a group management submap" })

hl.define_submap("group_management", function()
	map("t", hl.dsp.group.toggle(), "Toggle window group")

	map("h", hl.dsp.window.move({ into_group = "l" }), "Move window into a group on the left")
	map("j", hl.dsp.window.move({ into_group = "d" }), "Move window into a group on the bottom")
	map("k", hl.dsp.window.move({ into_group = "u" }), "Move window into a group on the top")
	map("l", hl.dsp.window.move({ into_group = "r" }), "Move window into a group on the right")

	map("q", hl.dsp.window.move({ out_of_group = true }), "Move window out of group")

	map("n", hl.dsp.group.next(), "Next window in group")
	map("p", hl.dsp.group.prev(), "Previous window in group")

	map("f", hl.dsp.group.move_window(), "Move window forward in the group order")
	map("b", hl.dsp.group.move_window({ forward = false }), "Move window backward in the group order")

	map("r", hl.dsp.group.lock_active(), "Toggle group lock")

	for i = 1, 10 do
		map(tostring(i % 10), hl.dsp.group.active({ index = i }), "Focus window " .. i .. " in a group")
	end

	map("e", function()
		local active_group = hl.get_active_window().group
		if active_group == nil then
			return
		end

		for _, win in ipairs(active_group.members) do
			hl.dispatch(hl.dsp.window.close({ window = win }))
		end
	end, "Close all windows in a group")

	map("a", function()
		local active_workspace = hl.get_active_workspace()
		local active_window = hl.get_active_window()

		if active_workspace == nil or active_window == nil then
			return
		end

		local windows = hl.get_workspace_windows(active_workspace)

		if active_window.group == nil then
			hl.dispatch(hl.dsp.group.toggle({ window = active_window }))
		end

		for _, win in ipairs(windows) do
			if win == active_window or win == nil then
				goto continue
			end

			active_window.group.add(active_window.group, win)

		    ::continue::
		end

		hl.dispatch(hl.dsp.focus({ window = active_window }))
	end, "Move all windows in the current workspace to a group")

	hl.bind("escape", hl.dsp.submap("reset"), { desc = "Quit submap" })
end)
