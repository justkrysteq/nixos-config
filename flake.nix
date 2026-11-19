{
	description = "NixOS config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-26.05";

		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, ... } @ inputs:
	let
		flake-dir = "/etc/nixos";
		username = "krysteq";
		system = "x86_64-linux";
		pkgs-stable = import inputs.nixpkgs-stable { inherit system; config.allowUnfree = true; };
		pkgs-unstable = import inputs.nixpkgs-unstable { inherit system; config.allowUnfree = true; };

		mkHost = hostname: nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs flake-dir username hostname pkgs-stable pkgs-unstable; };
			modules = [
				# Modules
				inputs.home-manager.nixosModules.default

				# Per Host Config
				(./hosts + "/${hostname}/configuration.nix")
			];
		};
	in
	{
		nixosConfigurations = {
			laptok = mkHost "laptok";
			pc = mkHost "pc";
		};

		nixosModules.yazi = import ./modules/system/programs/yazi/default.nix;
	};
}
