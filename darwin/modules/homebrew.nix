{ ... }: {
	system.primaryUser = "bronstedk";

	homebrew = {
		enable = true;
		casks = [ "vivaldi" ];
		brews = [ "mas" ];
		masApps = {
# "app_name" = "#app_id";
		};

		onActivation = {
			autoUpdate = true;
			upgrade = true;
			cleanup = "zap";
		};
	};
}
