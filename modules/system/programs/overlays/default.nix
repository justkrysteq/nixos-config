{ ... }:

{
	nixpkgs.overlays = [
		(import ./btop.nix)
		(import ./elephant.nix)
		(import ./vesktop.nix)
	];
}
