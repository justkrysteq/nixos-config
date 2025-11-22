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
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.battery
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.hyprland
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.network
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.notifd

				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.powerprofiles
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.wireplumber
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.tray
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.mpris
				inputs.astal.packages.${pkgs.stdenv.hostPlatform.system}.apps
			];
		};
	};
}
