{ flake-dir, hostname, ... }:

{
	environment.shellAliases = {
		ff = "fastfetch";
		la = "eza -a";
		ls = "eza";
		lsdir = "eza -D"; # list only directories
		lsfile = "eza -f"; # list only files
		tree = "eza --tree";
		treed = "eza -TD"; # a directory tree
		ll = "eza -l --total-size";
		lla = "eza -la --total-size";
		llaa = "eza -laa";
		ls1 = "eza -1 --icons";
		rebuild = "sudo nixos-rebuild switch --flake ${flake-dir}#${hostname}";
		lsgen = "nixos-rebuild list-generations";
		n = "nvim";
		ns = "sudo -EH nvim"; # May lead to potential permission issues in $XDG_RUNTIME_DIR but the -EH flag is needed for clipboard to work when opening files as root
		s = "sudo ";
		zn = "cd ${flake-dir}";
		clean = "sudo nix-collect-garbage -d";
		update = "zn; s nix flake update; rebuild; cd -";
		genshell = "touch shell.nix; echo '{pkgs ? import <nixpkgs> {} }:' > shell.nix; echo '' >> shell.nix; echo 'pkgs.mkShell {' >> shell.nix; echo '	buildInputs = with pkgs; [];' >> shell.nix; echo '}' >> shell.nix";
	};
}
