{ config, flake-dir, hostname, pkgs, ... }:
let
	link = f: config.lib.file.mkOutOfStoreSymlink "${flake-dir}/modules/home/config/${f}";
in
{
	xdg.configFile = {
		"hypr/hyprland.lua".source = link "hypr/shared/hyprland.lua";
		"hypr/hyprlock.conf".source = link "hypr/shared/hyprlock.conf";
		"hypr/hyprpaper.conf".source = link "hypr/shared/hyprpaper.conf";
		"hypr/xdph.conf".source = link "hypr/shared/xdph.conf";
		"hypr/hypridle.conf".source = link "hypr/${hostname}/hypridle.conf";
		"hypr/assets".source = link "hypr/shared/assets";
		"hypr/modules".source = link "hypr/shared/modules";
		"hypr/per-device/input.lua".source = link "hypr/${hostname}/input.lua";
		"hypr/per-device/monitors.lua".source = link "hypr/${hostname}/monitors.lua";
		"hypr/.luarc.json".text = /*json*/''
			{
				"workspace": {
					"library": [
						"${pkgs.hyprland}/share/hypr/stubs/hl.meta.lua"
					]
				}
			}
		'';

		"kitty/kitty.conf".source = link "kitty/kitty.conf";

		"fastfetch/config.jsonc".source = link "fastfetch/config.jsonc";

		"xdg-desktop-portal-termfilechooser" = {
			source = ./xdg-desktop-portal-termfilechooser;
			recursive = true;
		};

		"zed".source = link "zed";

		"systemd/user/xdg-desktop-portal.service".text = ''
[Unit]
Description=Portal service
PartOf=graphical-session.target
Requires=dbus.service
After=dbus.service
After=graphical-session.target

[Service]
Type=dbus
BusName=org.freedesktop.portal.Desktop
ExecStart=${pkgs.xdg-desktop-portal}/libexec/xdg-desktop-portal
Slice=session.slice
		'';

		# Brave Search Engines
		# NOTE: This does not work because the file needs to be in that directory, be mutable and not be a symlink
		# The solution for now is to copy the file to the config directory with this command
		# cp /etc/nixos/modules/home/config/brave/search-engines ~/.config/BraveSoftware/Brave-Browser/Default/Web Data

		# "BraveSoftware/Brave-Browser/Default/Web Data" = {
		# 	source = ./brave/search-engines;
		# 	force = true;
		# 	ignorelinks = true;
		# 	text = "test";
		# 	onChange = "cp ./brave/search-engines ~/.config/BraveSoftware/Brave-Browser/Default/Web Data";
		# };
	};
}
