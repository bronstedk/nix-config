{ ... }: {
	time.timeZone = "America/New_York";

	system.defaults = {
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
			persistent-apps = [];


		};
	};
}
