{
  lib,
  pkgs,
  ...
}: let
  sysCheck = lib.mkIf pkgs.stdenv.isLinux;
in {
  wayland.windowManager.hyprland = sysCheck {
    enable = true;

    extraConfig = let
      startFile = pkgs.writeShellScript "start.sh" ''
        #!${pkgs.bash}/bin/bash

        hyprpaper &

        nm-applet --indicator &

        waybar &

        hypridle &

        hyprpaper &

        swaync
      '';
    in ''
      exec-once=${pkgs.bash}/bin/bash ${startFile}
    '';

    settings = {
      monitor = ",preferred,auto,auto";

      "$mod" = "ALT";
      general = {
        border_size = 5;
      };

      input = {
        kb_layout = "us";
      };

      bind = [
        "$mod, space, exec, rofi -show drun -show-icons"
        "$mod, return, exec, alacritty"
        "$mod, W, killactive,"
        "$mod, M, exit,"
        "$mod, F, exec, nautilus"
        "$mod, B, exec, vivaldi"
        "$mod + SHIFT, space, togglefloating,"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        "$mod + SHIFT, 1, movetoworkspace, 1"
        "$mod + SHIFT, 2, movetoworkspace, 2"
        "$mod + SHIFT, 3, movetoworkspace, 3"
        "$mod + SHIFT, 4, movetoworkspace, 4"
        "$mod + SHIFT, 5, movetoworkspace, 5"
        "$mod + SHIFT, 6, movetoworkspace, 6"
        "$mod + SHIFT, 7, movetoworkspace, 7"
        "$mod + SHIFT, 8, movetoworkspace, 8"
        "$mod + SHIFT, 9, movetoworkspace, 9"
        "$mod + SHIFT, 0, movetoworkspace, 10"

        "SUPER + SHIFT, 3, exec, hyprshot -m window"
        "SUPER + SHIFT, 4, exec, hyprshot -m region"

        "SUPER + SHIFT, l, exec, hyprlock"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      bindl = [
        '',XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT\_AUDIO\_SINK@ 5%+''
        '',XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT\_AUDIO\_SINK@ 5%-''
        '',XF86AudioMute, exec, wpctl set-mute @DEFAULT\_AUDIO\_SINK@ toggle''
        '',XF86AudioMicMute, exec, wpctl set-mute @DEFAULT\_AUDIO\_SOURCE@ toggle''

        '', XF86AudioNext, exec, playerctl next''
        '', XF86AudioPause, exec, playerctl play-pause''
        '', XF86AudioPlay, exec, playerctl play-pause''
        '', XF86AudioPrev, exec, playerctl previous''
      ];

      windowrule = [
        "suppressevent maximize, class:.*"
      ];
    };
  };

  programs.hyprlock = sysCheck {
    enable = true;

    settings = {
      background = [
        {
          color = "rgba(25, 20, 20, 1.0)";
          blur_passes = 0;
          blur_size = 7;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibracy_darkness = 0.0;
        }
      ];

      input-field = [
        {
          size = "20%, 5%";
          outline_thickness = 3;
          inner_color = "rgba(0, 0, 0, 0.0)"; # no fill

          outer_color = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          check_color = "rgba(00ff99ee) rgba(ff6633ee) 120deg";
          fail_color = "rgba(ff6633ee) rgba(ff0066ee) 40deg";

          font_color = "rgb(143, 143, 143)";
          fade_on_empty = false;
          rounding = 15;

          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  services.hypridle = sysCheck {
    enable = true;

    settings = {
      general = {
        lock_cmd = ''pidof hyprlock || hyprlock'';
      };

      listener = [
        {
          timeout = 300;
          on-timeout = ''loginctl lock-session'';
        }
      ];
    };
  };

  services.hyprpaper = sysCheck {
    enable = true;

    settings = let
      wall = ''${../../shared/wallpapers/shaded.png}'';
    in {
      preload = wall;
      wallpaper = '', ${wall}'';
    };
  };
}
