{
	nixpkgs.overlays = [
		(import ./avalonia-ls.nix)
		(import ./btop.nix)
		(import ./elephant.nix)
		(import ./vesktop.nix)
		(import ./yazi-plugins.nix)
	];
}
