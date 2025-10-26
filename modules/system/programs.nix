{ pkgs, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [

		# Browsers
		brave

		# Apps
		vesktop signal-desktop kdePackages.kate kdePackages.kcalc obsidian
		mpv # media player

		# CLI Tools
		kitty
		eza # a modern replacement for ls
		wev # wayland event viewer
		jq # required for a bind to switch between floating and tiled windows in hyprland
		brightnessctl
		playerctl
		wireplumber # audio control
		wirelesstools # required for iwconfig to return wifi signal quicker
		wl-clipboard # required for screenshots
		trash-cli # required for recycle-bin plugin for yazi
		# rmpc # music player
		# joecalsend # TUI Localsend
		# cdrkit # for genisoimage
		# gdb # debugger do c

		# Dev
		nodePackages.nodejs nodePackages.typescript

		# DE/Rice
		hyprpaper hyprpicker hyprpolkitagent # Hyprland utils
		hyprshot swappy # Screenshots
		swaynotificationcenter libnotify # for notify-send # Notifiactions
		walker # App Launcher
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
			};
		};

		zsh = {
			enable = true;
			enableCompletion = true;
			autosuggestions.enable = true;
			syntaxHighlighting.enable = true;

			histSize = 5000;
			histFile = "$HOME/.zsh_history";
#			setOptions = [
#				"HIST_IGNORE_AALL_DUPS"
#			];

			ohMyZsh = {
				enable = true;
				theme = "gentoo";

				plugins = [
					"git"
				];
			};

			shellInit = ''
				function y() {
					local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
					yazi "$@" --cwd-file="$tmp"
					IFS= read -r -d $'\0' cwd < "$tmp"
					[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
					rm -f -- "$tmp"
				}
			'';
		};

		zoxide.enable = true;

		hyprland = {
			enable = true;
			xwayland.enable = true;
		};

		hyprlock.enable = true;
	};

	services.hypridle.enable = true;
}
