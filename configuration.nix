{ inputs, flake-dir, username, ... }:

{
	imports = [
		./modules/system
		./modules/hardware
		inputs.home-manager.nixosModules.default
	];

	# Configure console keymap
	console.keyMap = "pl2";

	home-manager = {
		extraSpecialArgs = { inherit inputs flake-dir username; };
		users = {
			${username} = import ./modules/home/home.nix;
		};
	};

	nix = {
		# Auto-delete old system states every week
		gc = {
			automatic = true;
			dates = "weekly";
			options = "--delete-older-than 7d";
		};

		settings = {
			# Enable flakes
			experimental-features = [ "nix-command" "flakes" ];

			# Cachix
			substituters = [
				"https://walker.cachix.org"
			];
			trusted-public-keys = [
				"walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
			];
		};
	};

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
