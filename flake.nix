{
	description = "NixOS config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		nixpkgs-treesitter.url = "github:nixos/nixpkgs/bde09022887110deb780067364a0818e89258968";

		nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-25.11";

		nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixpkgs-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		stylix = {
			url = "github:nix-community/stylix";
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
		pkgs-stable = inputs.nixpkgs-stable.legacyPackages.x86_64-linux;
		pkgs-unstable = inputs.nixpkgs-unstable.legacyPackages.x86_64-linux;
		pkgs-treesitter = inputs.nixpkgs-treesitter.legacyPackages.x86_64-linux;
	in
	{
		nixosConfigurations = {
			laptok = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs flake-dir username pkgs-stable pkgs-unstable pkgs-treesitter;
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
					inherit inputs flake-dir username pkgs-stable pkgs-unstable pkgs-treesitter;
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
