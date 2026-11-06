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

		millennium = {
			url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		additional-modules = {
			url = "github:justkrysteq/nixos-modules";
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
	in
	{
		nixosConfigurations = {
			laptok = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs flake-dir username pkgs-stable pkgs-unstable;
					hostname = "laptok";
				};
				modules = [
					./hosts/laptok/configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.additional-modules.nixosModules.brave
				];
			};

			pc = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs flake-dir username pkgs-stable pkgs-unstable;
					hostname = "pc";
				};
				modules = [
					./hosts/pc/configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.additional-modules.nixosModules.brave
				];
			};

		};
	};
}
