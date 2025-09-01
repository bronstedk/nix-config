{
  pkgs,
  config,
  ...
}: {
  time.timeZone = "America/New_York";

  system = {
    startup.chime = false;

    activationScripts.applications.text = let
      env = pkgs.buildEnv {
        name = "system-applications";
        paths = config.environment.systemPackages;
        pathsToLink = "/Applications";
      };
    in
      pkgs.lib.mkForce ''
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';

    defaults = {
      hitoolbox.AppleFnUsageType = "Start Dictation";

      loginwindow.GuestEnabled = false;

      controlcenter = {
        Sound = false;
        NowPlaying = false;
        FocusModes = false;
        Display = false;
        Bluetooth = false;
        AirDrop = false;

        BatteryShowPercentage = true;
      };

      dock = {
        persistent-apps = [
        ];

        autohide = true;

        wvous-tr-corner = 1;
        wvous-tl-corner = 1;
        wvous-br-corner = 11;
        wvous-bl-corner = 2;

        showhidden = true;
        show-recents = false;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        _FXSortFoldersFirst = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = true;
        FXPreferredViewStyle = "Nlsv";
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Home";
        ShowPathbar = true;
        ShowStatusBar = true;
      };

      NSGlobalDomain = {
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        AppleInterfaceStyle = "Dark";
      };

      WindowManager.AppWindowGroupingBehavior = true;
    };
  };
}
