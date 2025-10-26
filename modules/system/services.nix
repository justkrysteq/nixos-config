{ username, ... }:

{
	services = {
		# Enable KDE Plasma
		displayManager.sddm.enable = true;
		desktopManager.plasma6.enable = true;

		# Enable CUPS to print documents
		printing.enable = true;

		# openssh.enable = true;

		# Enable sound with pipewire
		pipewire = {
			enable = true;

			# Enable Advanced Linux Sound Architecture
			alsa = {
				enable = true;
				# support32Bit = true;
			};
			
			# PulseAudio server emulation
			pulse.enable = true;

		};

		# Music Player Daemon
		# mpd = {
			# enable = true;
			# musicDirectory = "/home/${username}/Music";
			# extraConfig = ''
			# 	audio_output {
			# 		type "alsa"
			# 		name "HDA Analog Deep Buffer"
			# 		# format "44100:16:2"
			# 		# format "48000:16:2"
			# 		# format "96000:24:2"
			# 		format "192000:24:2" # optional
			# 		mixer_type "hardware"
			# 		mixer_device "default"
			# 		mixer_control "PCM"
			# 	}
			# '';

			# extraConfig = ''
			# 	bind_to_address "127.0.0.1"
			#
			# 	audio_output {
			# 		type "pulse"
			# 		name "pulse"
			# 	}
			# '';
			#
			# startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
		# };
	};


	# Enable RealtimeKit system service, PulseAudio and PipeWire use this to acquire realtime priority
	security.rtkit.enable = true;
}
