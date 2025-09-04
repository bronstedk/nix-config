{...}: {
  system.primaryUser = "bronstedk";

  homebrew = {
    enable = true;
    taps = [
      # "FelixKratz/formulae"
    ];
    casks = [
      "localsend"
      "vivaldi"
      "font-sf-pro"
      "sf-symbols"
      "logi-options+"
      "todoist-app"
      "obsidian"
    ];
    brews = [
      "mas"
      # "sketchybar"
    ];
    masApps = {
      amphetamine = 937984704;
      "microsoft-word" = 462054704;
      # "app_name" = "#app_id";
    };

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };
}
