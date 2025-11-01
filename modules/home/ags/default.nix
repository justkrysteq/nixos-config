{ inputs, pkgs, ... }:

{
	imports = [
		inputs.ags.homeManagerModules.default
	];

	programs = {
		ags = {
			enable = true;

			# If you want home manager to manage the config
			configDir = ./config;

			extraPackages = [
				inputs.astal.packages.${pkgs.system}.battery
				inputs.astal.packages.${pkgs.system}.hyprland
				inputs.astal.packages.${pkgs.system}.network
				inputs.astal.packages.${pkgs.system}.notifd

				inputs.astal.packages.${pkgs.system}.powerprofiles
				inputs.astal.packages.${pkgs.system}.wireplumber
				inputs.astal.packages.${pkgs.system}.tray
				inputs.astal.packages.${pkgs.system}.mpris
				inputs.astal.packages.${pkgs.system}.apps
			];
		};
	};
}
