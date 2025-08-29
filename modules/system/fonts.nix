{ pkgs, ... }:

{
	fonts.packages = with pkgs; [
		nerd-fonts.hack
		source-han-sans # font for cn, jp and kr characters
	];

#	fontconfig = {
		
#	};
}
