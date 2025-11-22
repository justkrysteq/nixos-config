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

		promptInit = /* bash */''
			if [[ -n $IN_NIX_SHELL ]]; then
				PROMPT='%F{cyan}[󱄅] %(!.%B%F{red}.%B%F{green}%n@)%m %F{blue}%(!.%1~.%~) ''${vcs_info_msg_0_}%F{blue}%(!.#.$)%k%b%f'
			fi
		'';

		shellInit = /* bash */''
			function y() {
				local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
				yazi "$@" --cwd-file="$tmp"
				IFS= read -r -d $'\0' cwd < "$tmp"
				[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
				rm -f -- "$tmp"
			}

			# TODO: currently it asks for a passphrase every time
			# If remote is via ssh, needs a solution

			# check_git_repo() {
			# 	if git rev-parse --is-inside-work-tree &>/dev/null; then
			# 		git fetch
			#
			# 		LOCAL=$(git rev-parse @)
			# 		REMOTE=$(git rev-parse @{u})
			#
			# 		if [[ $LOCAL != $REMOTE ]]; then
			# 			echo "There are new commits in the remote repository."
			# 			echo "Update your local branch by running 'git pull'."
			# 		else
			# 			echo "Your local branch is up to date."
			# 		fi
			# 	fi
			# }
			#
			# function cd() {
			# 	builtin cd "$@"
			#
			# 	check_git_repo
			# }
		'';

		loginShellInit = /* bash */''
			if [[ $(tty) == /dev/tty1 && -z $SSH_CONNECTION && -z $DISPLAY ]]; then
				hyprland
			fi
		'';
	};
}
