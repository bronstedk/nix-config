{lib, pkgs, ...}: {
  programs.waybar = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;

    settings.mainBar = 
{
  height = 30;
  spacing = 4;

  modules-left = [
    "hyprland/workspaces"
  ];

  modules-center = [
    "hyprland/window"
  ];

  modules-right = [
    "mpd"
    "idle_inhibitor"
    "pulseaudio"
    "network"
    "power-profiles-daemon"
    "cpu"
    "memory"
    "temperature"
    "backlight"
    "keyboard-state"
    "clock"
    "tray"
    "custom/power"
  ];

#  Modules configuration

  "hyprland/workspaces" = {
    disable-scroll = true;
    all-outputs = true;
    warp-on-scroll = false;
    format = "{name}: {icon}";
    format-icons = {
      urgent = "";
      active = "";
      default = "";
    };
  };

  keyboard-state = {
    numlock = true;
    capslock = true;
    format = "{name} {icon}";
    format-icons = {
      locked = "";
      unlocked = "";
    };
  };

  mpd = {
    format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
    format-disconnected = "Disconnected ";
    format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
    unknown-tag = "N/A";
    interval = 5;
    consume-icons = {
      on = " ";
    };
    random-icons = {
      off = "<span color=\"#f53c3c\"></span> ";
      on = " ";
    };
    repeat-icons = {
      on = " ";
    };
    single-icons = {
      on = "1 ";
    };
    state-icons = {
      paused = "";
      playing = "";
    };
    tooltip-format = "MPD (connected)";
    tooltip-format-disconnected = "MPD (disconnected)";
  };

  idle_inhibitor = {
    format = "{icon}";
    format-icons = {
      activated = "";
      deactivated = "";
    };
  };

  tray = {
    spacing = 10;

    icons = {
        blueman = "bluetooth";
         };
  };

  clock = {
    timezone = "America/New_York";
    format = "{:%I:%M %p}";
    tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
    format-alt = "{:%Y-%m-%d}";
  };

  cpu = {
    format = "{usage}% ";
    tooltip = false;
  };

  memory = {
    format = "{}% ";
  };

  temperature = {
    critical-threshold = 80;
    format = "{temperatureC}°C {icon}";
    format-icons = [
      ""
      ""
      ""
    ];
  };

  backlight = {
    format = "{percent}% {icon}";
    format-icons = [
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
      ""
    ];
  };

  power-profiles-daemon = {
    format = "{icon}";
    tooltip-format = "Power profile: {profile}\nDriver: {driver}";
    tooltip = true;
    format-icons = {
      default = "";
      performance = "";
      balanced = "";
      power-saver = "";
    };
  };

  network = {
    format-wifi = "{essid} ({signalStrength}%) ";
    format-ethernet = "{ipaddr}/{cidr} ";
    tooltip-format = "{ifname} via {gwaddr} ";
    format-linked = "{ifname} (No IP) ";
    format-disconnected = "Disconnected ⚠";
    format-alt = "{ifname}: {ipaddr}/{cidr}";
  };

  pulseaudio = {
    format = "{volume}% {icon} {format_source}";
    format-bluetooth = "{volume}% {icon} {format_source}";
    format-bluetooth-muted = " {icon} {format_source}";
    format-muted = " {format_source}";
    format-source = "{volume}% ";
    format-source-muted = "";
    format-icons = {
      headphone = "";
      hands-free = "";
      headset = "";
      phone = "";
      portable = "";
      car = "";
      default = [
        ""
        ""
        ""
      ];
    };
    on-click = "pavucontrol";
  };

  "custom/power" = {
    format = "⏻ ";
    tooltip = false;
    menu = "on-click";
    menu-file = let 
      xmlFile = pkgs.writeTextFile {
	name = "power_menu.xml";
	text = (builtins.readFile ./power_menu.xml);
      };
    in "${xmlFile}";
    menu-actions = {
      shutdown = "shutdown";
      reboot = "reboot";
      suspend = "systemctl suspend";
      hibernate = "systemctl hibernate";
    };
  };
};
  };
}
