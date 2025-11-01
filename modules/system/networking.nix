{ hostname, ... }:

{
	networking = {
		hostName = hostname;

		networkmanager.enable = true;
#		wireless.enable = true;
	};
}
