{ pkgs, ... }:

{
	# Use latest kernel.
	# boot.kernelPackages = pkgs.linuxPackages_latest;
	boot.kernelPackages = pkgs.linuxPackages_latest;
}
