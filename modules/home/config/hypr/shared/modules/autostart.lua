-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper & hypridle & swaync")
	-- hl.exec_cmd("/nix/store/ib89gwl5gzhqrzmgnpmq4fn1w73nndd7-dbus-1.14.10/bin/dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target")

	hl.exec_cmd("ags run")

	hl.exec_cmd("elephant")
	hl.exec_cmd("walker --gapplication-service")

	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("signal-desktop --start-in-tray --no-sandbox")
	hl.exec_cmd("clipse -listen")
end)
