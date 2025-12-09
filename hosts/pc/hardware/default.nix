{ ... }:

{
	imports = [
		./drivers.nix
		./hardware-configuration.nix
	];

	boot.kernelParams = [ "nvidia_drm.fbdev=1" "nvidia-drm.modeset=1" ]; # Hopefully a fix for random freezes
}
