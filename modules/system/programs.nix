{ pkgs, inputs, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [

		# Browsers
		brave

		# Apps
		vesktop signal-desktop kdePackages.kate kdePackages.kcalc obsidian

		# CLI Tools
		kitty
		eza # a modern replacement for ls
		wev # wayland event viewer
		jq # needed for a bind to switch between floating and tiled windows in hyprland
		brightnessctl
		playerctl
		wireplumber # audio control
		wirelesstools # needed for iwconfig to return wifi signal quicker
		wl-clipboard
		cdrkit # for genisoimage
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

		git = {
			enable = true;
			config = {
				user.name = "Krysteq";
				user.email = "justkrysteq@proton.me";
				init.defaultBranch = "main";
			};
		};
		
#		neovim = {
#			enable = true;
#			defaultEditor = true;
#		};

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
				plugins = [
					"git"
					"z"
				];
				theme = "gentoo";
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

		hyprland = {
			enable = true;
			xwayland.enable = true;
		};

		hyprlock.enable = true;

		# https://wiki.nixos.org/wiki/Yazi
		# https://yazi-rs.github.io/docs/quick-start/
		# https://yazi-rs.github.io/docs/tips#selected-files-to-clipboard
		yazi.enable = true;
	};

	services.hypridle.enable = true;
}
