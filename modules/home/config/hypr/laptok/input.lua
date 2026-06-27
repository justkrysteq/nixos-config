-------------
--- INPUT ---
-------------

-- https://wiki.hypr.land/Configuring/Variables/#input
hl.config({
	input = {
		kb_layout = "pl",
		kb_model = "pc104",

		follow_mouse = 1,

		sensitivity = 0.2,

		touchpad = {
			natural_scroll = false,
			disable_while_typing = false
		}
	},

	gestures = {
		workspace_swipe_distance = 125,
		workspace_swipe_cancel_ratio = 0.3,
		workspace_swipe_create_new = true,
		workspace_swipe_forever = false
	}
})

-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})
