{ ... }: {
	programs.oh-my-posh = {
		enable = true;

		enableBashIntegration = true;
		enableNushellIntegration = true;
		enableZshIntegration = true;

		settings = let
			blue = "#89B4FA";
			pink = "#F5C2E7";
			lavender = "#B4BEFE";
			os = "#ACB0BE";
			closer = os;
		in {
			version = 3;
			final_space = true;

			upgrade = {
				source = "cdn";
				interval = "168h";
				auto = false;
				notice = false;
			};

			transient_prompt = {
				template = " ";
				foreground = closer;
				background = "transparent";
				newline = true;
			};

			secondary_prompt = {
				template = " ";
				foreground = closer;
			};

			blocks = [
				{
					type = "prompt";
					alignment = "left";
					newline = true;
					segments = [
						{
							template = "{{.Icon}} ";
							foreground = os;
							type = os;
							style = "plain";
						}
						{
							template = "{{ .UserName }} ";
							foreground = blue;
							type = "session";
							style = "plain";
						}
						{
							template = "{{ .Path }} ";
							foreground = pink;
							type = "path";
							style = "plain";
							properties = {
								home_icon = "~";
								style = "full";
							};
						}
						{
							template = "{{ .HEAD }} ";
							foreground = lavender;
							type = "git";
							style = "plain";
							properties = {
								branch_icon = " ";
								cherry_pick_icon = " ";
								commit_icon = " ";
								fetch_status = false;
								fetch_upstream_icon = false;
								merge_icon = " ";
								no_commits_icon = " ";
								rebase_icon = " ";
								revert_icon = " ";
								tag_icon = " ";
							};
						}
						{
							type = "jujutsu";
							style = "plain";
							foreground = pink;
						}
					];
				}
				{
					type = "rprompt";
					overflow = "hidden";
					segments = [
						{
							type = "executiontime";
							style = "plain";
							foreground = pink;
							template = "{{ .FormattedMs }}";
							properties = {
								style = "roundrock";
							};
						}
						{
							type = "shell";
							style = "plain";
							foreground = closer;
						}
						{
							type = "root";
							style = "plain";
							foreground = lavender;
							template = "root";
						}
					];
				}
				{
					type = "prompt";
					alignment = "left";
					newline = true;
					segments = [
						{
							template = "";
							foreground = closer;
							type = "text";
							style = "plain";
						}
					];
				}
			];
		};
	};
}
