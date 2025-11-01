{ pkgs, username, ... }:

{
	virtualisation = {
		libvirtd = {
			enable = true;
			# extraConfig = "user=krysteq"; # Not sure what it does and if I need that

			onBoot = "ignore";
			onShutdown = "shutdown";

			qemu = {
				package = pkgs.qemu_kvm;
				swtpm.enable = true;

				runAsRoot = false;

				verbatimConfig = ''
					s = []
					user = "+krysteq"
				'';
			};
		};

		# spiceUSBRedirection.enable = true;
	};

	programs.virt-manager.enable = true;

	boot = {
		initrd.kernelModules = [
			"vfio"
			"vfio_pci"
			"vfio_iommu_type1"
		];
		kernelParams = [
			"iommu=pt"
			"kvm.ignore_msrs=1"
		];
	};

	users.users.${username}.extraGroups = [ "libvirtd" "qemu-libvirtd" ];

	# Add looking glass
}
