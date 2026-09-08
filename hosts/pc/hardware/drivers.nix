{ config, ... }:

{
	hardware = {
		graphics.enable = true;

		nvidia = {
			modesetting.enable = true;

			# Nvidia power management. Experimental, and can cause sleep/suspend to fail.
			# Enable this if you have graphical corruption issues or application crashes after waking
			# up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
			# of just the bare essentials.
			powerManagement = {
				enable = false;
				finegrained = false;
			};

			open = false;

			nvidiaSettings = false;

			package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
		};

		opentabletdriver.enable = true;

		uinput.enable = true;
	};

	boot.kernelModules = [ "uinput" ];

	# Load nvidia driver for Xorg and Wayland
	services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
}
