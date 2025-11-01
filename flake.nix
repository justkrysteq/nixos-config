{
	description = "NixOS config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprlauncher = {
			url = "github:hyprwm/hyprlauncher";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		ags.url = "github:Aylur/ags";
		astal.url = "github:Aylur/astal";

		nixCats.url = "github:BirdeeHub/nixCats-nvim";
	};

	outputs = { self, nixpkgs, ... } @ inputs:
	let
		flake-dir = "/etc/nixos";
		username = "krysteq";
	in
	{
		nixosConfigurations = {
			laptok = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs flake-dir username;
					hostname = "laptok";
				};
				modules = [
					./hosts/laptok/configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.stylix.nixosModules.stylix
				];
			};

			pc = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs flake-dir username;
					hostname = "pc";
				};
				modules = [
					./hosts/pc/configuration.nix
					inputs.home-manager.nixosModules.default
					inputs.stylix.nixosModules.stylix
				];
			};

		};
	};
}
