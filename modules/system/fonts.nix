{ pkgs, ... }:

{
	fonts = {
		packages = with pkgs; [
			nerd-fonts.hack
			source-han-sans # font for cn, jp and kr characters
			noto-fonts
			noto-fonts-color-emoji
			# inter roboto jost montserrat poppins lato
		];

		fontconfig = {
			enable = true;

			defaultFonts = {
				monospace = [ "Hack NerdFont Mono" ];
				sansSerif = [ "Noto Sans" ];
				serif = [ "Noto Serif" ];
				emoji = [ "Noto Color Emoji" ];
			};
		};
	};
}
