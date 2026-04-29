{ ... }:

{
	nixpkgs.overlays = [
		(import ./elephant.nix)
		(import ./vesktop.nix)
	];
}
