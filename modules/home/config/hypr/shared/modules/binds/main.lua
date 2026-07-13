-------------------
--- KEYBINDINGS ---
-------------------

require("modules.binds.navigation")
require("modules.binds.submaps")

hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"), { desc = "Open kitty, [Q]itty" })
hl.bind("SUPER + E", hl.dsp.window.close(), { desc = "Close window, [E]xit" })
hl.bind("SUPER + SHIFT + E", hl.dsp.window.kill(), { desc = "Kill a window, Force [E]xit" })
hl.bind("SUPER + End", hl.dsp.exit(), { desc = "Exit, [End] session" })
hl.bind("SUPER + F", hl.dsp.window.float({ action = "toggle" }), { desc = "Toggle floating, [F]loat" })
hl.bind("SUPER + SHIFT + F", hl.dsp.window.float({ action = "toggle", centered = true }), { desc = "Toggle floating centered, [F]loat centered" })
hl.bind("SUPER + S", hl.dsp.exec_cmd("walker"), { desc = "Open walker, [S]tart an app" })
hl.bind("SUPER + P", hl.dsp.window.pseudo(), { desc = "Pseudo window, [P]seudo" }) -- dwindle
hl.bind("SUPER + B", hl.dsp.exec_cmd("brave"), { desc = "Open Brave, [B]rowser" })
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("brave --incognito"), { desc = "Open Brave in incognito mode, [B]rowser incognito" })
hl.bind("SUPER + W", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { desc = "Toggle fullscreen, [W]hole screen" })
hl.bind("SUPER + SHIFT + W", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }), { desc = "Toggle maximisation, Maximise [W]indow" })
hl.bind("SUPER + SHIFT + Backslash", hl.dsp.force_renderer_reload(), { desc = "Force renderer reload" })
hl.bind("SUPER + Semicolon", hl.dsp.exec_cmd("hyprlock"), { desc = "Lock screen, [Semicolo]ck" })
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"), { desc = "Show notifications panel, [N]otifications" })
hl.bind("SUPER + T", hl.dsp.exec_cmd("ags toggle \"bar\""), { desc = "Toggle ags bar, [T]oggle bar" })
hl.bind("SUPER + SHIFT + T", hl.dsp.layout("togglesplit"), { desc = "Toggle split, [T]oggle split" }) -- dwindle
hl.bind("SUPER + C", hl.dsp.exec_cmd("qalculate-gtk"), { desc = "Open calculator, [C]alculator" })

-- Clipboard manager
hl.bind("SUPER + V", function()
	hl.dispatch(hl.dsp.exec_cmd("kitty --class clipse -e clipse; hyprctl dispatch \"hl.dsp.send_shortcut({ mods = \\\"CTRL\\\", key = \\\"V\\\" })\""))
end, { desc = "Open clipboard manager and autopaste, [V] just like pasting :D" })
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("kitty --class clipse -e clipse"), { desc = "Open clipboard manager, [V]iew clipboard" })

-- Switch between floating and tiled windows
hl.bind("SUPER + A", function()
	if hl.get_active_window().floating then
		hl.dispatch(hl.dsp.window.cycle_next({ tiled = true }))
	else
		hl.dispatch(hl.dsp.window.cycle_next({ floating = true }))
	end
end, { desc = "Cycle between floating and tiled windows" })
hl.bind("SUPER + SHIFT + A", function()
	if hl.get_active_window().floating then
		hl.dispatch(hl.dsp.window.cycle_next({ next = false, tiled = true }))
	else
		hl.dispatch(hl.dsp.window.cycle_next({ next = false, floating = true }))
	end
end, { desc = "Cycle between floating and tiled windows (reverse)" })

-- Cycle window focus
hl.bind("SUPER + Tab", hl.dsp.window.cycle_next(), { desc = "Cycle window focus" })
hl.bind("SUPER + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }), { desc = "Cycle window focus (reverse)" })

-- Cycle workspace focus
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { desc = "Cycle window focus" })
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { desc = "Cycle window focus" })
hl.bind("SUPER + SHIFT + Tab", hl.dsp.window.cycle_next({ next = false }), { desc = "Cycle window focus (reverse)" })

-- Cycle monitor focus
hl.bind("SUPER + Grave", hl.dsp.focus({ monitor = "+1" }), { desc = "Cycle monitor focus" })
hl.bind("SUPER + SHIFT + Grave", hl.dsp.window.move({ monitor = "+1" }), { desc = "Cycle monitor focus (reverse)" })
hl.bind("SUPER + CTRL + Grave", hl.dsp.focus({ monitor = "-1" }), { desc = "Cycle monitor focus (reverse)" })

-- Groups
hl.bind("SUPER + G", hl.dsp.group.toggle(), { desc = "Toggle window group, [G]roup" })
hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ into_group = "l" }), { desc = "Move window into a group when it's on the left, [G]roup" }) -- TODO: preferably it should auto detect the first group in the workspace and move into it
hl.bind("SUPER + CTRL + G", hl.dsp.window.move({ out_of_group = true }), { desc = "Move window out of group, [G]roup" })
hl.bind("SUPER + Space", hl.dsp.group.next(), { desc = "Next window in group" })
hl.bind("SUPER + SHIFT + Space", hl.dsp.group.prev(), { desc = "Previous window in group" })
hl.bind("SUPER + CTRL + Space", hl.dsp.group.move_window(), { desc = "Move window in the group order, Move in [G]roup" })
hl.bind("SUPER + CTRL + SHIFT + Space", hl.dsp.group.move_window({ forward = false }), { desc = "Move window in the group order (reverse), Move in [G]roup" })

-- Minimize window
hl.bind("SUPER + D", function()
	if hl.get_workspace("special:minimized") then
		hl.dispatch(hl.dsp.window.move({ workspace = hl.get_active_workspace(), window = "tag:minimized" }))
		hl.dispatch(hl.dsp.window.clear_tags({ window = "tag:minimized" }))
	else
		hl.dispatch(hl.dsp.window.tag({ tag = "minimized", window = hl.get_active_window() }))
		hl.dispatch(hl.dsp.window.move({ workspace = "special:minimized", follow = false }))
	end
end, { desc = "Minimize window, [D]own" })

-- Special workspace to float over all workspaces - Change to FIFO minimize
-- hl.bind("SUPER + SHIFT + D", hl.dsp.workspace.toggle_special({ name = "superfloat" }), { desc = "Toggle special workspace" })
-- hl.bind("SUPER + ALT + D", hl.dsp.window.move({ workspace = "special:superfloat" }), { desc = "Move to special workspace" })

-- Screenshots
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -zsm region --clipboard-only"), { desc = "Screenshot region to clipboard" })
hl.bind("SUPER + CTRL + SHIFT + S", hl.dsp.exec_cmd("hyprshot -zm region -o $HOME/Pictures/Screenshots"), { desc = "Screenshot region to clipboard and save to ~/Pictures/Screenshots/" })
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -sm active --mode output --clipboard-only"), { desc = "Screenshot screen to clipboard" })
hl.bind("CTRL + PRINT", hl.dsp.exec_cmd("wl-paste | swappy -f -"), { desc = "Open swappy with an image from clipboard" })
hl.bind("CTRL + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -sm active --mode output --clipboard-only; wl-paste | swappy -f -"), { desc = "Screenshot screen and open swappy" })
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -sm active --mode window --clipboard-only"), { desc = "Screenshot window to clipboard" })
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd("hyprshot -m active --mode window -o $HOME/Pictures/Screenshots"), { desc = "Screenshot window to clipboard and save to ~/Pictures/Screenshots/" })

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + Z", hl.dsp.window.drag(), { mouse = true, desc = "Move window" })
hl.bind("SUPER + X", hl.dsp.window.resize(), { mouse = true, desc = "Resize window" })
-- hl.bind("SUPER + SHIFT + X", hl.dsp.window.resize({ keep_aspect_ratio = true }), { mouse = true, desc = "Resize window and keep aspect ratio" })

-- Multimedia keys for volume and LCD brightness [F-keys]
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true, desc = "Increase volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true, desc = "Decrease volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, desc = "Toggle mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, desc = "Toggle microphone mute" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { repeating = true, locked = true, desc = "Increase brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { repeating = true, locked = true, desc = "Decrease brightness" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, desc = "Previous track" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, desc = "Play/Pause track" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, desc = "Next track" })

-- Binds for apps
-- Currently doesn't work
hl.bind("SUPER + M", hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "M", window = "initialClass:^(vesktop)$" }), { desc = "Mute on Discord, [M]ute" })
hl.bind("SUPER + SHIFT + M", hl.dsp.send_shortcut({ mods = "CTRL SHIFT", key = "D", window = "initialClass:^(vesktop)$" }), { desc = "Deafen on Discord" })

-- Laptop extra binds
hl.bind("XF86Calculator", hl.dsp.exec_cmd("qalculate-gtk"), { desc = "Launch Calculator" })
hl.bind("XF86Launch2", hl.dsp.exec_cmd("kitty --hold zsh -c \"fastfetch\""), { desc = "Launch kitty with fastfetch" })
