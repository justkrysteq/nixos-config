{ ... }:

{
	imports = [
		./bootloader.nix
		./fonts.nix
		./kernel.nix
		./locale.nix
		./networking.nix
		./nvim
		./programs.nix
		./services.nix
		./shell-aliases.nix
		./users.nix
	];
}
