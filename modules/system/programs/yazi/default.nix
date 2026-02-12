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
			inherit (pkgs.yaziPlugins) relative-motions;
			inherit (pkgs.yaziPlugins) compress;
			inherit (pkgs.yaziPlugins) jump-to-char;
			inherit (pkgs.yaziPlugins) mediainfo;
			inherit (pkgs.yaziPlugins) chmod;

			zoom = pkgs.fetchFromGitHub {
				owner = "yazi-rs";
				repo = "plugins";
				rev = "88990a6cf1d31afd9d8db1a0d74bf37ef50d6786";
				hash = "sha256-0K6qGgbGt8N6HgGNEmn2FDLar6hCPiPBbvOsrTjSubM=";
			} + "/zoom.yazi";
		};

		settings = {
			theme = {
				indicator = {
					padding = {
						open = "█";
						close = "█";
					};
				};

				spot = {
					title = {
						fg = "green";
					};
				};

				icon = {
					append_dirs = [
						{ name = "media"; text = ""; fg = "blue"; }
						{ name = "nvim"; text = ""; fg = "blue"; }
						{ name = "yazi"; text = "󰇥"; fg = "blue"; }
					];

					prepend_dirs = [
						{ name = "Code"; text = ""; fg = "blue"; }
						{ name = "Desktop"; text = ""; fg = "blue"; }
						{ name = "Documents"; text = ""; fg = "blue"; }
						{ name = "Downloads"; text = ""; fg = "blue"; }
						{ name = "Library"; text = ""; fg = "blue"; }
						{ name = "Movies"; text = ""; fg = "blue"; }
						{ name = "Music"; text = ""; fg = "blue"; }
						{ name = "Pictures"; text = ""; fg = "blue"; }
						{ name = "Public"; text = ""; fg = "blue"; }
						{ name = "Templates"; text = ""; fg = "blue"; }
						{ name = "Videos"; text = ""; fg = "blue"; }
					];
				};
			};

			keymap = {
				mgr = {
					append_keymap = [
						{ on = [ "g" "n" ]; run = "cd ${flake-dir}"; desc = "Go ${flake-dir}"; }
						{ on = [ "g" "r" ]; run = "cd /"; desc = "Go /"; }
						{ on = [ "g" "p" ]; run = "cd $HOME/Documents/Projects"; desc = "Go ~/Documents/Projects"; }
						{ on = [ "g" "t" ]; run = "tab_switch 1 --relative"; desc = "Switch to next tab"; }
						{ on = [ "g" "T" ]; run = "tab_switch -1 --relative"; desc = "Switch to previous tab"; }

						{ on = [ "m" "M" ]; run = "linemode size_and_mtime"; desc = "Linemode: size and modification time"; }
						{ on = [ "m" "c" ]; run = "linemode size_and_btime"; desc = "Linemode: size and creation time"; }

						{ on = [ "C" "a" ]; run = "plugin compress"; desc = "Archive selected files"; }
						{ on = [ "C" "p" ]; run = "plugin compress -p"; desc = "Archive selected files (password)"; }
						{ on = [ "C" "h" ]; run = "plugin compress -ph"; desc = "Archive selected files (password+header)"; }
						{ on = [ "C" "l" ]; run = "plugin compress -l"; desc = "Archive selected files (compression level)"; }
						{ on = [ "C" "u" ]; run = "plugin compress -phl"; desc = "Archive selected files (password+header+level)"; }
						{ on = [ "C" "7" ]; run = "plugin compress 7z"; desc = "Archive selected files to 7z"; }
						{ on = [ "C" "r" ]; run = "plugin compress rar"; desc = "Archive selected files to rar"; }
						{ on = [ "C" "t" ]; run = "plugin compress tar.gz"; desc = "Archive selected files to tar.gz"; }

						{ on = "u"; run = "plugin restore"; desc = "Restore last deleted files/folders"; }
						{ on = "U"; run = "plugin restore -- --interactive"; desc = "Restore deleted files/folders (Interactive)"; }
						{ on = "M"; run = "plugin mount"; desc = "Open Mount menu"; }

						{ on = "F"; run = "plugin jump-to-char"; desc = "Jump to char"; }

						{ on = [ "R" "b" ]; run = "plugin recycle-bin"; desc = "Open Recycle Bin menu"; }
						# { on = [ "R" "m" ]; run = "plugin mediainfo -- toggle-metadata"; desc = "Toggle media preview metadata"; }
						{ on = [ "R" "d" ]; run = "shell -- dragon-drop -x -i -T -a %s"; desc = "Drag file(s) with dragon"; }

						{ on = [ "c" "m" ]; run = "plugin chmod"; desc = "Chmod on selected files"; }
					];

					prepend_keymap = [
						{ on = "1"; run = "plugin relative-motions 1"; desc = "Move in relative steps"; }
						{ on = "2"; run = "plugin relative-motions 2"; desc = "Move in relative steps"; }
						{ on = "3"; run = "plugin relative-motions 3"; desc = "Move in relative steps"; }
						{ on = "4"; run = "plugin relative-motions 4"; desc = "Move in relative steps"; }
						{ on = "5"; run = "plugin relative-motions 5"; desc = "Move in relative steps"; }
						{ on = "6"; run = "plugin relative-motions 6"; desc = "Move in relative steps"; }
						{ on = "7"; run = "plugin relative-motions 7"; desc = "Move in relative steps"; }
						{ on = "8"; run = "plugin relative-motions 8"; desc = "Move in relative steps"; }
						{ on = "9"; run = "plugin relative-motions 9"; desc = "Move in relative steps"; }
						{ on = "0"; run = "plugin relative-motions 0"; desc = "Move in relative steps"; }

						{ on = "+"; run = "plugin zoom 1"; desc = "Zoom in hovered file"; }
						{ on = "-"; run = "plugin zoom -1"; desc = "Zoom out hovered file"; }
					];
				};
			};

			yazi = {
				plugin = {
					prepend_preloaders = [
						{ mime = "{audio,video,image}/*"; run = "mediainfo"; }
						{ mime = "application/subrip"; run = "mediainfo"; }
						{ mime = "application/postscript"; run = "mediainfo"; }
					];

					prepend_previewers = [
						{ mime = "{audio,video,image}/*"; run = "mediainfo"; }
						{ mime = "application/subrip"; run = "mediainfo"; }
						{ mime = "application/postscript"; run = "mediainfo"; }
					];
				};
			};
		};
	};
}
