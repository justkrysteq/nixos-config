---------------------
--- LOOK AND FEEL ---
---------------------

-- Refer to https://wiki.hypr.land/Configuring/Variables/

-- https://wiki.hypr.land/Configuring/Variables/#general
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 10,

		border_size = 2,

		-- https://wiki.hypr.land/Configuring/Variables/#variable-types for info about colors
		col = {
			active_border = { colors = {"rgba(1c99ffee)", "rgba(5402b3ee)"}, angle = 30},
			inactive_border = "rgba(595959aa)"
		},

		resize_on_border = false,

		layout = "dwindle"
	},

	-- https://wiki.hypr.land/Configuring/Variables/#decoration
	decoration = {
		rounding = 5,
		rounding_power = 4,

		active_opacity = 1.0,
		inactive_opacity = 1.0,

		dim_inactive = true,
		dim_strength = 0.12,

		-- https://wiki.hypr.land/Configuring/Variables/#blur
		blur = {
			-- Style 1
			-- enabled = true
			-- size = 9 - Previously 5
			-- passes = 2
			--
			-- noise = 0
			-- vibrancy = 0.1696
			-- vibrancy_darkness = 0.3

			-- Style 2
			enabled = true,
			size = 10,
			passes = 3,
			brightness = 1,
			noise = 0.05,
			contrast = 0.89,
			vibrancy = 0.5,
			vibrancy_darkness = 0.5,
			popups_ignorealpha = 0.6,
			input_methods = true,
			input_methods_ignorealpha = 0.8
		},

		shadow = {
			enabled = true,
			range = 8,
			render_power = 6,
			color = "rgba(1a1a1aee)"
		}
	},

		-- See https://wiki.hypr.land/Configuring/Dwindle-Layout/ for more
	dwindle = {
		preserve_split = true
	},

	-- See https://wiki.hypr.land/Configuring/Master-Layout/ for more
	master  = {
		new_status = "master"
	},

	------------
	--- MISC ---
	------------

	misc = {
		disable_autoreload = false, -- set to true when you finish configuring (might save on battery)
		middle_click_paste = false
	},

	render = {
		direct_scanout = 2 -- Optimization (1 for all fullscreen apps, 2 - for games) - if there are graphical glitches in fullscreen set to 0
	},

	ecosystem = {
		no_donation_nag = true
	},

	binds = {
		disable_keybind_grabbing = true
	}
})
