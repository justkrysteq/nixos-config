{ inputs, flake-dir, username, hostname, ... }:

{
	imports = [
		../../modules/system
		./hardware
		inputs.home-manager.nixosModules.default
	];

	home-manager = {
		extraSpecialArgs = { inherit inputs flake-dir username hostname; };
		users = {
			${username} = import ../../modules/home/home.nix;
		};
	};
}
