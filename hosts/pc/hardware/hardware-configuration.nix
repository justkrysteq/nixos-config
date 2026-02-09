{ config, lib, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-uuid/0979a3ad-11e1-4995-89c4-054881597e10";
			fsType = "ext4";
		};

		"/boot" = {
			device = "/dev/disk/by-uuid/0472-23D2";
			fsType = "vfat";
			options = [ "fmask=0077" "dmask=0077" ];
		};

		"/F" = {
			device = "/dev/disk/by-uuid/F8BA6370BA632A78";
			fsType = "ntfs-3g";
			options = [ "rw" "uid=1000" ];
		};

		"/K" = {
			device = "/dev/disk/by-uuid/0C5230525230432E";
			fsType = "ntfs-3g";
			options = [ "rw" "uid=1000" ];
		};
	};

	boot = {
		initrd = {
			availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
			kernelModules = [ ];
			
			luks.devices."luks-f91c85b8-5d9c-45e2-964f-a010a27fa3d2".device = "/dev/disk/by-uuid/f91c85b8-5d9c-45e2-964f-a010a27fa3d2";
		};

		kernelModules = [ "kvm-intel" ];
		extraModulePackages = [ ];
		supportedFilesystems = [ "ntfs" ];
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
