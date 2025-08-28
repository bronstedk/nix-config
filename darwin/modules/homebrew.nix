{...}: {
  system.primaryUser = "bronstedk";

  homebrew = {
    enable = true;
    casks = [
      "vivaldi"
      "sf-symbols"
      "logi-options+"
    ];
    brews = ["mas"];
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
