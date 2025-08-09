{ inputs, flake-dir, ... }:

{
	imports =
		[
			./modules/system
			./modules/hardware
			inputs.home-manager.nixosModules.default
		];

	networking.hostName = "nixos"; # Define your hostname.
#	networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	# Enable flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Configure network proxy if necessary
#	networking.proxy.default = "http://user:password@proxy:port/";
#	networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	# Enable networking
	networking.networkmanager.enable = true;

	# Enable the X11 windowing system.
	# You can disable this if you're only using the Wayland session.
	services.xserver.enable = false;

	# Enable the KDE Plasma Desktop Environment.
	services.displayManager.sddm.enable = true;
	services.desktopManager.plasma6.enable = true;

	# Configure keymap in X11
	services.xserver.xkb = {
		layout = "pl";
		variant = "";
	};

	# Configure console keymap
	console.keyMap = "pl2";

	# Enable CUPS to print documents.
	services.printing.enable = true;

	# Enable sound with pipewire.
	services.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
#		jack.enable = true;

		# use the example session manager (no others are packaged yet so this is enabled by default,
		# no need to redefine it in your config for now)
		#media-session.enable = true;
	};

	home-manager = {
		extraSpecialArgs = { inherit inputs flake-dir; };
		users = {
			"krysteq" = import ./modules/home/home.nix;
		};
	};

	# Automatic deletion of old system states
	nix.gc = {
		automatic = true;
		dates = "weekly";
		options = "--delete-older-than 7d";
	};

	environment.sessionVariables = {
		# If cursor becomes invisible
#		WLR_NO_HARDWARE_CURSORS = "1";
		# Hint electron apps to use wayland
		NIXOS_OZONE_WL = "1";
	};

	# Some programs need SUID wrappers, can be configured further or are
	# started in user sessions.
#	programs.mtr.enable = true;
#	programs.gnupg.agent = {
#		enable = true;
#		enableSSHSupport = true;
#	};

	# List services that you want to enable:

	# Enable the OpenSSH daemon.
	# services.openssh.enable = true;

	# Open ports in the firewall.
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# Or disable the firewall altogether.
	# networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.05"; # Did you read the comment?
}
