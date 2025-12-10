{ pkgs, hostname, ... }:
let
	isPC = if hostname == "pc" then true else false;
in
{
  # Use latest kernel.
  # boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelPackages = if isPC then pkgs.linuxPackages_latest else pkgs.linuxKernel.packages.linux_6_17;
}
