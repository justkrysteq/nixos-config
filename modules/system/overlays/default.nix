{ ... }:

{
	nixpkgs.overlays = [
		(import ./elephant.nix)
	];
}
