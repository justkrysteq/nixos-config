{ ... }:

{
	programs.zsh = {
		enable = true;
		enableCompletion = true;
		autosuggestions.enable = true;
		syntaxHighlighting.enable = true;

		histSize = 5000;
		histFile = "$HOME/.zsh_history";

		ohMyZsh = {
			enable = true;
			theme = "gentoo";

			plugins = [
				"git"
				"z"
			];
		};

		promptInit = ''
			if [[ -n $IN_NIX_SHELL ]]; then
				PROMPT='%F{cyan}[󱄅] %(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) ''${vcs_info_msg_0_}%F{blue}%(!.#.$)%k%b%f '
			fi
		'';

		shellInit = ''
			function y() {
				local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
				yazi "$@" --cwd-file="$tmp"
				IFS= read -r -d $'\0' cwd < "$tmp"
				[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
				rm -f -- "$tmp"
			}
		'';

		loginShellInit = ''
			if [[ $(tty) == /dev/tty1 && -z $SSH_CONNECTION && -z $DISPLAY ]]; then
				hyprland
			fi
		'';
	};
}
