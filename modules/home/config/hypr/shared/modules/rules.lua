------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------

-- See https://wiki.hypr.land/Configuring/Window-Rules/ for more
-- See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

hl.window_rule({
	name = "floating-calculator",
	match = {
		class = "qalculate-gtk",
	},
	float = true,
	move = { 1271, 50 },
	size = { 464, 629 },
})

hl.window_rule({
	name = "floating-obsidian",
	match = {
		class = "obsidian",
	},
	float = true,
	move = { 379, 48 },
	size = { 1160, 959 },
})

hl.window_rule({
	name = "floating-clipboard-manager",
	match = {
		class = "clipse",
	},
	float = true,
	size = { 822, 652 },
	stay_focused = true,
	center = true,
})

hl.window_rule({
	name = "floating-yazi-as-filechooser",
	match = {
		class = "terminal-filechooser",
	},
	float = true,
	size = { 1500, 850 },
	center = true,
})

hl.window_rule({
	name = "floating-zed-settings",
	match = {
		initial_title = "Zed — Settings",
	},
	float = true,
	size = { 1018, 1012 },
	center = true,
})

-- Ignore maximize requests from apps
hl.window_rule({
	name  = "ignore-maximize-requests-from-apps",
	match = { class = ".*" },

	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	name  = "fix-xwayland-drags",
	match = {
		class      = "^$",
		title      = "^$",
		xwayland   = true,
		float      = true,
		fullscreen = false,
		pin        = false,
	},

	no_focus = true,
})

-- Set border color on fullscreen
hl.window_rule({
	name = "change-border-color-on-fullscreen",
	match = {
		fullscreen = 1,
	},
	border_color = { colors = { "rgba(8d00e2ee)", "rgba(5402b3ee)" }, angle = 30 },
})

-- Idle inhibits
hl.window_rule({
	name = "idle-inhibit-when-rebuilding",
	match = {
		class = "kitty",
		title = "*sudo nixos-rebuild switch*",
	},
	idle_inhibit = "always",
})
