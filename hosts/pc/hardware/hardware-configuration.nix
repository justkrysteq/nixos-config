{ config, lib, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-uuid/8cb78b32-3f65-4140-ad88-6b4cd98027e1";
			fsType = "ext4";
		};

		"/boot" = {
			device = "/dev/disk/by-uuid/8B2A-F346";
			fsType = "vfat";
			options = [ "fmask=0077" "dmask=0077" ];
		};

		"/F" = {
			device = "/dev/disk/by-uuid/F8BA6370BA632A78";
			fsType = "ntfs";
			options = [ "nofail" "x-systemd.device-timeout=5s" "nosuid" "nodev" "uid=1000" "gid=1000" "fmask=0177" "dmask=0077" "windows_names" "sys_immutable" ];
		};

		# "/K" = {
		# 	device = "/dev/disk/by-uuid/0C5230525230432E";
		# 	fsType = "ntfs";
		# 	options = [ "nofail" ];
		# };
	};

	boot = {
		initrd = {
			availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
			kernelModules = [ ];
			
			luks.devices."luks-4186d49f-8a40-43dd-adc7-643a5f7b63e3".device = "/dev/disk/by-uuid/4186d49f-8a40-43dd-adc7-643a5f7b63e3";
		};

		kernelModules = [ "kvm-intel" ];
		extraModulePackages = [ ];
	};

	swapDevices = [ {
		device = "/var/lib/swapfile";
		size = 16*1024;
	} ];

	# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
	# (the default) this is the recommended approach. When using systemd-networkd it's
	# still possible to use this option, but it's recommended to use it in conjunction
	# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
	networking.useDHCP = lib.mkDefault true;
	# networking.interfaces.enp5s0.useDHCP = lib.mkDefault true;

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
