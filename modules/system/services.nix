{ ... }:

{
	services = {
		# Enable KDE Plasma
		displayManager.sddm.enable = true;
		desktopManager.plasma6.enable = true;

		# Enable CUPS to print documents
		printing.enable = true;

		# Enable sound with pipewire
		pipewire = {
			enable = true;

			# Enable Advanced Linux Sound Architecture
			alsa = {
				enable = true;
				support32Bit = true;
			};
			
			# PulseAudio server emulation
			pulse.enable = true;

		};
	};

	# Enable RealtimeKit system service, PulseAudio and PipeWire use this to acquire realtime priority
	security.rtkit.enable = true;
}
