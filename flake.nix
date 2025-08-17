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

		# App launcher (walker is undergoing a rewrite so it may not work)
		walker = {
			url = "github:abenz1267/walker/0.13.26";
			inputs.nixpkgs.follows = "nixpkgs";
		};

#		astal.url = "github:aylur/astal";
#		ags.url = "github:Aylur/ags";
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
