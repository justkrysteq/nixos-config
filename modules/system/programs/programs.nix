{ pkgs, pkgs-unstable, pkgs-stable, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		# Browsers
		brave-origin

		# Apps
		vesktop signal-desktop obsidian
		mpv # Media Player
		kdePackages.dolphin # File Manager
		qalculate-gtk # Calculator
		zed-editor
		kitty
		gimp
		pavucontrol # Volume Control
		# foliate # E-Book Reader

		# Games
		prismlauncher # Minecraft
		tty-solitaire # freesweep tetris

		# CLI Tools
		fastfetch
		btop
		eza # a modern replacement for ls
		wev # wayland event viewer
		jq # required for a bind to switch between floating and tiled windows in hyprland NOT ANYMORE
		brightnessctl
		playerctl
		wireplumber # audio control
		wirelesstools # required for iwconfig to return wifi signal quicker
		wl-clipboard # required for screenshots
		trash-cli # required for recycle-bin plugin for yazi
		dragon-drop # drag and drop utility
		nix-prefetch-github # utility to get the latest commit hash of a repo
		clipse # clipboard manager
		mediainfo # required for mediainfo plugin for yazi
		ffmpeg
		vivify # view markdown in a browser
		yt-dlp
		sops
		# rmpc # music player
		# joecalsend # TUI Localsend
		# cdrkit # for genisoimage

		# DE/Rice
		hyprpaper hyprpicker # hyprpolkitagent # Hyprland utils
		hyprshot swappy # Screenshots
		libnotify # for notify-send # Notifications
		# swaynotificationcenter
		elephant walker # App Launcher
		# quickshell # Widgets
		libsForQt5.qt5ct qt6Packages.qt6ct
	];

	programs = {
		steam = {
			enable = true;
			package = pkgs.millennium-steam;
		};

		obs-studio = {
			enable = true;
			enableVirtualCamera = true;
		};

		localsend.enable = true;

		ssh = {
			startAgent = true;
			extraConfig = "AddKeysToAgent yes";
		};

		zoxide.enable = true;

		hyprland = {
			enable = true;
			xwayland.enable = true;
			package = pkgs.hyprland;
		};

		hyprlock.enable = true;

		noctalia.enable = true;
	};

	services.hypridle.enable = true;
}
