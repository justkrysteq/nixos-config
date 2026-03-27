{ pkgs, pkgs-unstable, pkgs-stable, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [

		# Browsers
		# brave

		# Apps
		vesktop pkgs-unstable.signal-desktop obsidian
		mpv # Media Player
		kdePackages.dolphin # File Manager
		qalculate-gtk # Calculator

		# Games
		prismlauncher # Minecraft
		tty-solitaire

		# CLI Tools
		kitty
		fastfetch
		btop
		eza # a modern replacement for ls
		wev # wayland event viewer
		jq # required for a bind to switch between floating and tiled windows in hyprland
		brightnessctl
		playerctl
		wireplumber # audio control
		wirelesstools # required for iwconfig to return wifi signal quicker
		wl-clipboard # required for screenshots
		trash-cli # required for recycle-bin plugin for yazi
		pavucontrol # volume mixer
		gimp # image editor
		dragon-drop # drag and drop utility
		nix-prefetch-github # utility to get the latest commit hash of a repo
		clipse # clipboard manager
		killall
		mediainfo # required for mediainfo plugin for yazi
		ffmpeg
		vivify
		# rmpc # music player
		# joecalsend # TUI Localsend
		# cdrkit # for genisoimage
		# gdb # c debugger

		# DE/Rice
		hyprpaper hyprpicker hyprpolkitagent # Hyprland utils
		pkgs-stable.hyprshot swappy # Screenshots
		swaynotificationcenter libnotify # for notify-send # Notifications
		elephant walker # App Launcher
		quickshell # Widgets
	];

	programs = {
		steam.enable = true;

		obs-studio.enable = true;

		localsend.enable = true;

		git = {
			enable = true;
			config = {
				user.name = "Krysteq";
				user.email = "justkrysteq@proton.me";
				init.defaultBranch = "main";
				core.sshCommand = "ssh -i ~/.ssh/git";
			};
		};

		ssh = {
			startAgent = true;
			extraConfig = "AddKeysToAgent yes";
		};

		zoxide.enable = true;

		hyprland = {
			enable = true;
			xwayland.enable = true;
			package = pkgs-unstable.hyprland;
		};

		hyprlock.enable = true;
	};

	services.hypridle.enable = true;
}
