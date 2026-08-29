{ pkgs, lib, ... }:
let
	sshKey = "~/.ssh/git";
	gitCustomGpgProgram = pkgs.writeShellScriptBin "git-custom-gpg-program" ''
		ssh-add -T ${sshKey} 2>&- || ssh-add ${sshKey}
		exec ssh-keygen "$@"
	'';
in 
{
	programs.git = {
		enable = true;
		config = {
			user = {
				name = "Krysteq";
				email = "justkrysteq@proton.me";
				signingKey = "${sshKey}.pub";
			};

			init.defaultBranch = "main";
			core.sshCommand = "ssh -i ${sshKey}";
			commit.gpgSign = true;
			gpg = {
				format = "ssh";
				ssh.program = lib.getExe gitCustomGpgProgram;
			};
		};
	};
}
