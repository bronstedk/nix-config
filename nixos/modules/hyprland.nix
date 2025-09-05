{lib, pkgs, ...}:{
  wayland.windowManager.hyprland = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;

    extraConfig =let
      startFile = pkgs.writeShellScript "start.sh" ''
	#!${pkgs.bash}/bin/bash

	swww init &

	# swww img $wallpaper_path &

	nm-applet --indicator &

	waybar &

	swaync
      '';
    in ''
      exec-once=${pkgs.bash}/bin/bash ${startFile}
    '';

    settings =  {
      monitor = ",preferred,auto,auto";

      "$mod" = "ALT";
      general = {
	border_size = 5;
      };

      decoration = {
	active_opacity = 1.0;
	inactive_opacity = 0.5;
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

	"$mod + SHIFT, 1, movetoworkspace, 1"
	"$mod + SHIFT, 2, movetoworkspace, 2"
	"$mod + SHIFT, 3, movetoworkspace, 3"
	"$mod + SHIFT, 4, movetoworkspace, 4"

	"SUPER + SHIFT, 3, exec, hyprshot -m window"
	"SUPER + SHIFT, 4, exec, hyprshot -m region"
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
    };
  };
}
