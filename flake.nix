{
	description = "NixOS config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
		nixpkgs-old.url = "github:NixOS/nixpkgs/5e2a59a5b1a82f89f2c7e598302a9cacebb72a67"; # for getting older OneDark theme version

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
		pkgs-old = inputs.nixpkgs-old.legacyPackages.x86_64-linux;
	in
	{
		nixosConfigurations = {
			laptok = nixpkgs.lib.nixosSystem {
				specialArgs = {
					inherit inputs flake-dir username pkgs-old;
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
					inherit inputs flake-dir username pkgs-old;
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
