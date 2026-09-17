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
		"hypr/per-device/behaviors.lua".source = link "hypr/${hostname}/behaviors.lua";
		"hypr/per-device/monitors.lua".source = link "hypr/${hostname}/monitors.lua";
		"hypr/.luarc.json".text = builtins.toJSON {
			workspace.library = [ "${pkgs.hyprland}/share/hypr/stubs/hl.meta.lua" ];
		};

		"kitty/kitty.conf".source = link "kitty/kitty.conf";

		"fastfetch/config.jsonc".source = link "fastfetch/config.jsonc";

		"noctalia".source = link "noctalia";

		"qt5ct/qt5ct.conf".source = link "qt5ct/qt5ct.conf";
		"qt6ct/qt6ct.conf".source = link "qt6ct/qt6ct.conf";

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

		"systemd/user/xdg-desktop-portal-hyprland.service.d/qt-style.conf".text = ''
			[Service]
			Environment=QT_STYLE_OVERRIDE=
			Environment=QT_QPA_PLATFORMTHEME=
		'';
	};
}
