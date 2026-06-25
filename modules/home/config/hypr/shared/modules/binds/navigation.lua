------------------------------
--- NAVIGATION KEYBINDINGS ---
------------------------------

-- Move focus with mainMod + arrow keys or hjkl
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "l" }), { desc = "Move focus left" })
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "r" }), { desc = "Move focus right" })
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "u" }), { desc = "Move focus up" })
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "d" }), { desc = "Move focus down" })

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }), { desc = "Move focus left" })
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }), { desc = "Move focus down" })
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }), { desc = "Move focus up" })
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }), { desc = "Move focus right" })

-- Move window with mainMod + ALT + arrow keys or hjkl
hl.bind("SUPER + ALT + Left", hl.dsp.window.move({ direction = "l" }), { desc = "Move window left" })
hl.bind("SUPER + ALT + Right", hl.dsp.window.move({ direction = "r" }), { desc = "Move window right" })
hl.bind("SUPER + ALT + Up", hl.dsp.window.move({ direction = "u" }), { desc = "Move window up" })
hl.bind("SUPER + ALT + Down", hl.dsp.window.move({ direction = "d" }), { desc = "Move window down" })

hl.bind("SUPER + ALT + H", hl.dsp.window.move({ direction = "l" }), { desc = "Move window left" })
hl.bind("SUPER + ALT + J", hl.dsp.window.move({ direction = "d" }), { desc = "Move window down" })
hl.bind("SUPER + ALT + K", hl.dsp.window.move({ direction = "u" }), { desc = "Move window up" })
hl.bind("SUPER + ALT + L", hl.dsp.window.move({ direction = "r" }), { desc = "Move window right" })

-- Swap window with mainMod + SHIFT + arrow keys or hjkl
hl.bind("SUPER + SHIFT + Left", hl.dsp.window.swap({ direction = "l" }), { desc = "Swap window left" })
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.swap({ direction = "r" }), { desc = "Swap window right" })
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.swap({ direction = "u" }), { desc = "Swap window up" })
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.swap({ direction = "d" }), { desc = "Swap window down" })

hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "l" }), { desc = "Swap window left" })
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "d" }), { desc = "Swap window down" })
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "u" }), { desc = "Swap window up" })
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "r" }), { desc = "Swap window right" })

for i = 1, 10 do
	local key = i % 10
	local j = 10 + i

	-- Switch workspaces with mainMod + [0-9]
	hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = "" .. i }), { desc = "Switch to workspace " .. i })

	-- Move active window to a workspace with mainMod + SHIFT + [0-9]
	hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = "" .. i }), { desc = "Move window to workspace " .. i })

	-- Move active window silently to a workspace with mainMod + ALT + [0-9]
	hl.bind("SUPER + ALT + " .. key, hl.dsp.window.move({ workspace = "" .. i, follow = false }), { desc = "Move window to workspace " .. i .. " silently" })

	-- Switch workspaces with mainMod + CTRL + [0-9] on the 2nd monitor
	hl.bind("SUPER + CTRL + " .. key, hl.dsp.focus({ workspace = "" .. j }), { desc = "Switch to workspace " .. i .. " on the 2nd monitor" })

	-- Move active window to a workspace with mainMod + CTRL + SHIFT + [0-9] on the 2nd monitor
	hl.bind("SUPER + CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = "" .. j }), { desc = "Move window to workspace " .. i .. " on the 2nd monitor" })

	-- Move active window silently to a workspace with mainMod + CTRL + ALT + [0-9] on the 2nd monitor
	hl.bind("SUPER + CTRL + ALT + " .. key, hl.dsp.window.move({ workspace = j, follow = false }), { desc = "Move window to workspace " .. i .. " on the 2nd monitor silently" })
end
