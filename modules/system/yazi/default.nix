{ pkgs, flake-dir, ... }:

{
	# https://wiki.nixos.org/wiki/Yazi
	# https://yazi-rs.github.io/docs/quick-start/
	# https://yazi-rs.github.io/docs/tips#selected-files-to-clipboard
	programs.yazi = {
		enable = true;

		initLua = ./init.lua;

		plugins = {
			inherit (pkgs.yaziPlugins) recycle-bin;
			inherit (pkgs.yaziPlugins) restore;
			inherit (pkgs.yaziPlugins) mount;
		};

		settings = {
			keymap = {
				mgr = {
					append_keymap = [
						{ on = [ "g"  "n" ]; run = "cd ${flake-dir}"; desc = "Go ${flake-dir}"; }
						{ on = [ "R" "b" ]; run = "plugin recycle-bin"; desc = "Open Recycle Bin menu"; }
						{ on = "u"; run = "plugin restore"; desc = "Restore last deleted files/folders"; }
						{ on = "U"; run = "plugin restore -- --interactive"; desc = "Restore deleted files/folders (Interactive)"; }
						{ on = "M"; run = "plugin mount"; desc = "Open Mount menu"; }
						{ on = [ "m" "M" ]; run = "linemode size_and_mtime"; desc = "Linemode: size and modification time"; }
						{ on = [ "m" "c" ]; run = "linemode size_and_btime"; desc = "Linemode: size and creation time"; }
					];
				};
			};
		};
	};
}
