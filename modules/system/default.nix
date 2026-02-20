{ ... }:

{
	imports = [
		./boot.nix
		./fonts.nix
		./kernel.nix
		./locale.nix
		./networking.nix
		./overlays
		./programs
		./services.nix
		./shell-aliases.nix
		./stylix.nix
		./system.nix
		./users.nix
		./virtualisation.nix
	];
}
