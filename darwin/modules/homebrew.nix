{...}: {
  system.primaryUser = "bronstedk";

  homebrew = {
    enable = true;
    taps = [
      "FelixKratz/formulae"
    ];
    casks = [
      "vivaldi"
      "font-sf-pro"
      "sf-symbols"
      "logi-options+"
      "todoist-app"
    ];
    brews = [
      "mas"
      "sketchybar"
    ];
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
