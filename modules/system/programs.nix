{ pkgs, inputs, ... }:

{
	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	environment.systemPackages = with pkgs; [
		brave
		vesktop
		kdePackages.kate
		kdePackages.kcalc
		kdePackages.kolourpaint
		kitty
		waybar
		eza # a modern replacement for ls
		wev # wayland event viewer
#		deepin.deepin-calculator
#		nwg-look # GTK settings editor
		jq # needed for a bind to switch between floating and tiled windows in hyprland
		hyprpaper
		hyprpicker
	];

	programs = {
		steam.enable = true;

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

			shellAliases = {
				ff = "fastfetch";
				la = "eza -a";
				ls = "eza";
				lsdir = "eza -D";
				lsfile = "eza -f";
				tree = "eza --tree";
				ll = "eza -l --total-size";
				lla = "eza -la --total-size";
				rebuild = "sudo nixos-rebuild switch";
				lsgen = "nixos-rebuild list-generations";
				n = "nvim";
				sn = "sudo nvim";
				ns = "sudo nvim";
				s = "sudo";
				hms = "home-manager switch";
				clean = "sudo nix-collect-garbage -d";
				update = "cd /etc/nixos; sudo nix flake update; sudo nixos-rebuild switch";
			};

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
		};

		hyprland = {
			enable = true;
			xwayland.enable = true;
			package = inputs.hyprland.packages."${pkgs.system}".hyprland;
			portalPackage = inputs.hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
		};

		hyprlock.enable = true;
	};

	services.hypridle.enable = true;
}
