{ inputs, ... }:

{
	imports = [
		../../modules/system
		./hardware
		inputs.home-manager.nixosModules.default
	];
}
