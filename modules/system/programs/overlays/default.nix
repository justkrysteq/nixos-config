{ inputs, ... }:

{
	nixpkgs.overlays = [
		(import ./btop.nix)
		(import ./elephant.nix)
		(import ./vesktop.nix)
		(import ./yazi-plugins.nix)
		inputs.millennium.overlays.default
	];
}
