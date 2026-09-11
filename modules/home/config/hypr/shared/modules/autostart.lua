-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
	-- hl.exec_cmd("hyprpaper & hypridle & swaync")
	hl.exec_cmd("hypridle")

	-- hl.exec_cmd("ags run")
	hl.exec_cmd("noctalia")

	hl.exec_cmd("elephant")
	hl.exec_cmd("walker --gapplication-service")

	-- hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("signal-desktop --start-in-tray --no-sandbox")
	-- hl.exec_cmd("clipse -listen")
end)
