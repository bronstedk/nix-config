{ ... }: {
	time.timeZone = "America/New_York";

	system = {
		startup.chime = false; 

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
				_HIHideMenuBar = true;
			};

			WindowManager.AppWindowGroupingBehavior = true;
		};
	};
}
