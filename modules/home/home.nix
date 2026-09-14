{ username, pkgs, ... }:

{
	imports = [
		./config
		./fonts
		./scripts
	];

	home = {
		username = "${username}";
		homeDirectory = "/home/${username}";
		stateVersion = "26.05";

		pointerCursor = {
			enable = true;
			name = "breeze_cursors";
			size = 24;
			package = pkgs.kdePackages.breeze;
		};
	};

	gtk = {
		enable = true;
		iconTheme = {
			package = pkgs.kdePackages.breeze-icons;
			name = "breeze-dark";
		};

		colorScheme = "dark";

		font = {
			name = "Noto Sans";
			size = 10;
		};
	};

	xdg.portal = {
		enable = true;
		extraPortals = with pkgs; [
			xdg-desktop-portal-termfilechooser
			xdg-desktop-portal-hyprland
		];

		config = {
			common."org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
		};
	};
}
