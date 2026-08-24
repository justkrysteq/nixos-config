---------------------------------
--- DEVICE-SPECIFIC BEHAVIORS ---
---------------------------------

hl.window_rule({
	name = "signal-on-w-3",
	match = {
		class = "signal",
	},
	workspace = "3",
	group = "set"
})

hl.window_rule({
	name = "vesktop-on-w-3",
	match = {
		class = "vesktop",
	},
	workspace = "3",
	group = "set"
})
