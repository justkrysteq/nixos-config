{ pkgs, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [

		# Browsers
		# brave # now defined in chromium.nix

		# Apps
		vesktop signal-desktop obsidian
		mpv # Media Player
		kdePackages.dolphin # File Manager

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
		# mediainfo # required for mediainfo plugin for yazi
		# rmpc # music player
		# joecalsend # TUI Localsend
		# cdrkit # for genisoimage
		# gdb # c debugger

		# Dev
		nodePackages.nodejs nodePackages.typescript

		# DE/Rice
		hyprpaper hyprpicker hyprpolkitagent # Hyprland utils
		hyprshot swappy # Screenshots
		swaynotificationcenter libnotify # for notify-send # Notifications
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
				core.sshCommand = "ssh -i ~/.ssh/git";
			};
		};

		zsh = {
			enable = true;
			enableCompletion = true;
			autosuggestions.enable = true;
			syntaxHighlighting.enable = true;

			histSize = 5000;
			histFile = "$HOME/.zsh_history";

			ohMyZsh = {
				enable = true;
				theme = "gentoo";

				plugins = [
					"git"
					"z"
				];
			};

			promptInit = ''
				if [[ -n $IN_NIX_SHELL ]]; then
					PROMPT='%F{cyan}[󱄅] %(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) ''${vcs_info_msg_0_}%F{blue}%(!.#.$)%k%b%f '
				fi
			'';

			shellInit = ''
				function y() {
					local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
					yazi "$@" --cwd-file="$tmp"
					IFS= read -r -d $'\0' cwd < "$tmp"
					[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
					rm -f -- "$tmp"
				}
			'';

			loginShellInit = ''
				if [[ $(tty) == /dev/tty1 && -z $SSH_CONNECTION && -z $DISPLAY ]]; then
					hyprland
				fi
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
