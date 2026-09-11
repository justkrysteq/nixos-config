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
	};

	gtk = {
		enable = true;
		iconTheme = {
			package = pkgs.kdePackages.breeze-icons;
			name = "breeze-dark";
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

	dconf.settings = {
		"org/gnome/desktop/interface" = {
			color-scheme = "prefer-dark";
		};
	};
}
