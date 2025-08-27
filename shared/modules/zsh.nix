{ lib, ... }: {
	programs.zsh = {
		enable = true;

		initContent = lib.mkOrder 1000 ''
			bindkey -v

			function y() {
				local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
				yazi "$@" --cwd-file="$tmp"
				IFS= read -r -d ${"''"} cwd < "$tmp"
				[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
				rm -f -- "$tmp"
			}
		'';

		enableCompletion = true;
		autosuggestion.enable = true;

		syntaxHighlighting = {
			enable = true;
			highlighters = [ "main" "brackets" "cursor" "root" ];
		};

		shellAliases = {
			"ll" = "eza -lha -s name --icons=always";
			"c" = "clear";
			"vi" = "nvim";
			"vim" = "nvim";
		};

		oh-my-zsh = {
			enable = true;
			plugins = [
				"sudo"
				"git"
				"command-not-found"
			];
		};
	};
}
