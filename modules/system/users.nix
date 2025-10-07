{ pkgs, username, lib, ... }:
let
	capitalizedUsername = lib.toUpper (builtins.substring 0 1 username) + (builtins.substring 1 (-1) username);
in
{
	# Define a user account. Don't forget to set a password with ‘passwd’.
	users = {
		users.${username} = {
			shell = pkgs.zsh;
			isNormalUser = true;
			description = capitalizedUsername;
			extraGroups = [ "networkmanager" "wheel" ];
		};

		defaultUserShell = pkgs.zsh;
	};
}
