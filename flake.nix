{
	description = "NixOS config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
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
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs flake-dir username; };
				modules = [
					./configuration.nix
					inputs.home-manager.nixosModules.default
				];
			};
		};
}
