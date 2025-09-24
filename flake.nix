{
	description = "NixOS config flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = {
			url = "github:hyprwm/Hyprland";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		walker = {
			url = "github:abenz1267/walker";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		ags.url = "github:Aylur/ags";
		astal.url = "github:Aylur/astal";

		nixCats = {
#			url = "path:/home/krysteq/Documents/tesciu-nixCats";
			url = "github:BirdeeHub/nixCats-nvim";
#			inputs.nixpkgs.follows = "nixpkgs";
		};

	};

	outputs = { self, nixpkgs, ... } @ inputs:
	let
		flake-dir = "/etc/nixos";
	in
		{
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				specialArgs = { inherit inputs flake-dir; };
				modules = [
					./configuration.nix
					inputs.home-manager.nixosModules.default
				];
			};
		};
}
