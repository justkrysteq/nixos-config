{ config, lib, modulesPath, ... }:

{
	imports = [
		(modulesPath + "/installer/scan/not-detected.nix")
	];

	fileSystems = {
		"/" = {
			device = "/dev/disk/by-uuid/bc1d6ae8-592b-4b90-9acf-17c70a88e0b4";
			fsType = "ext4";
		};

		"/boot" = {
			device = "/dev/disk/by-uuid/01E7-6BC2";
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
			
			luks.devices."luks-d5764546-b744-4659-9719-7d5c7145ac7b".device = "/dev/disk/by-uuid/d5764546-b744-4659-9719-7d5c7145ac7b";
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
