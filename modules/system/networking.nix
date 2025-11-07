{ hostname, ... }:

{
	networking = {
		hostName = hostname;

		networkmanager = {
			enable = true;
			dns = "systemd-resolved";
		};
		nameservers = [
			"45.90.28.0#374e98.dns.nextdns.io"
			"45.90.30.0#374e98.dns.nextdns.io"
		];
#		wireless.enable = true;
	};

	services.resolved = {
		enable = true;
		dnsovertls = "true";
		domains = [
			"~."
		];
		fallbackDns = [
			""
		];
		llmnr = "false";
	};
}
