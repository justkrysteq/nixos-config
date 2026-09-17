{ pkgs, flake-dir, ... }:

{
	# https://wiki.nixos.org/wiki/Yazi
	# https://yazi-rs.github.io/docs/quick-start/
	# https://yazi-rs.github.io/docs/tips#selected-files-to-clipboard
	programs.yazi = {
		enable = true;

		initLua = ./init.lua;

		plugins = {
			inherit (pkgs.yaziPlugins)
				recycle-bin
				restore
				mount
				relative-motions
				compress
				jump-to-char
				mediainfo
				chmod
				git
				easyjump
				zoom
			;

			dir-rules = ./plugins/dir-rules;
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
						{ name = "go"; text = "󰟓"; fg = "blue"; }
						{ name = "media"; text = ""; fg = "blue"; }
						{ name = "nvim"; text = ""; fg = "blue"; }
						{ name = "yazi"; text = "󰇥"; fg = "blue"; }
						{ name = "hypr"; text = ""; fg = "blue"; }
						{ name = "pc"; text = "󰪫"; fg = "blue"; }
						{ name = "laptok"; text = ""; fg = "blue"; }
						{ name = "nix"; text = "󱄅"; fg = "blue"; }
						{ name = "system"; text = ""; fg = "blue"; }
						{ name = "home"; text = ""; fg = "blue"; }
						{ name = "packages"; text = "󰏗"; fg = "blue"; }
						{ name = "programs"; text = ""; fg = "blue"; }
						{ name = "24.07 *"; text = "󰀥"; fg = "blue"; }
						{ name = "gimp"; text = ""; fg = "blue"; }
						{ name = "overlays"; text = ""; fg = "blue"; }
						{ name = "forgejo"; text = ""; fg = "blue"; }
						{ name = "Notatki"; text = ""; fg = "blue"; }
						{ name = "ISO"; text = ""; fg = "blue"; }
						{ name = "Books"; text = "󰗚"; fg = "blue"; }
						{ name = "fonts"; text = "󰛖"; fg = "blue"; }
						{ name = "config"; text = ""; fg = "blue"; }
						{ name = "scripts"; text = ""; fg = "blue"; }
						{ name = "plugins"; text = ""; fg = "blue"; }
						{ name = "lua"; text = ""; fg = "blue"; }
						{ name = "lockscreen"; text = "󰌾"; fg = "blue"; }
						{ name = "docs"; text = "󱔗"; fg = "blue"; }
						{ name = "assets"; text = ""; fg = "blue"; }
						{ name = "_old"; text = "󰯊"; fg = "blue"; }
						{ name = "Archive"; text = ""; fg = "blue"; }
						{ name = "Archived"; text = ""; fg = "blue"; }
						{ name = "hosts"; text = "󰾰"; fg = "blue"; }
						{ name = "devices"; text = "󰾰"; fg = "blue"; }
						{ name = "modules"; text = "󰀻"; fg = "blue"; }
						{ name = "nixos"; text = ""; fg = "blue"; }
						{ name = ".ssh"; text = "󰣀"; fg = "blue"; }
						{ name = "Projects"; text = ""; fg = "blue"; }
						{ name = "utils"; text = "󱁤"; fg = "blue"; }
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

					prepend_exts = [
						{ name = "go"; text = "󰟓"; fg = "#00add8"; }
						{ name = "mid"; text = "󰣱"; fg = "cyan"; }
					];
				};
			};

			keymap = {
				mgr = {
					append_keymap = [
						{ on = [ "g" "n" ]; run = "cd ${flake-dir}"; desc = "Go ${flake-dir}"; }
						{ on = [ "g" "/" ]; run = "cd /"; desc = "Go /"; }
						{ on = [ "g" "r" ]; run = "shell -- ya emit cd \"$(git rev-parse --show-toplevel)\""; desc = "Go to git repository root"; }
						{ on = [ "g" "p" ]; run = "cd $HOME/Documents/Projects"; desc = "Go ~/Documents/Projects"; }
						{ on = "<C-o>"; run = "back"; desc = "Go to previous directory"; }

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
						# { on = [ "R" "d" ]; run = "shell -- dragon-drop -x -i -T -a %s"; desc = "Drag file(s) with dragon"; }
						{ on = [ "R" "w" ]; run = "shell -- hyprctl hyprpaper wallpaper ,\"%s\""; desc = "Set as wallpaper"; }
						{ on = [ "R" "g" ]; run = "shell -- git restore --staged %s"; desc = "Git restore file"; }

						{ on = [ "c" "m" ]; run = "plugin chmod"; desc = "Chmod on selected files"; }
						{ on = "i"; run = "plugin easyjump"; desc = "Enter hop mode"; }
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

						{ on = [ "g" "t" ]; run = "tab_switch 1 --relative"; desc = "Switch to next tab"; }
						{ on = [ "g" "T" ]; run = "tab_switch -1 --relative"; desc = "Switch to previous tab"; }
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

					prepend_fetchers = [
						{ url = "*"; run = "git"; group = "git"; }
						{ url = "*/"; run = "git"; group = "git"; }
					];
				};
			};
		};
	};
}
