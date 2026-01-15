{ ... }:

{
	nix = {
		# Auto-delete old system states every week
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};

		# Auto-optimise nix-store every week
		optimise = {
			automatic = true;
			dates = "weekly";
		};

		settings = {
			# Enable flakes
			experimental-features = [ "nix-command" "flakes" ];
		};
	};
	
	# Configure console keymap
	console.keyMap = "pl2";

	environment = {
		variables = {
			EDITOR = "nvim";
		};

		sessionVariables = {
			# Hint electron apps to use wayland
			NIXOS_OZONE_WL = "1";
		};
	};

	# Default values from NixOS 25.05
	system.stateVersion = "25.05";
}
