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

	dunst
      '';
    in ''
      exec-once=bash ${startFile}
    '';

    settings =  {
      monitor = "HDMI-A-1,preferred,auto,auto";

      "$mod" = "ALT";

      bind = [
	"$mod, space, exec, rofi -show drun -show-icons"
	"$mod, return, exec, alacritty"
	"$mod, W, killactive,"
	"$mod, M, exit,"
	"$mod, F, exec, nautilus"
	"$mod, B, exec, vivaldi"

	"$mod, H, movefocus, l"
	"$mod, L, movefocus, r"
	"$mod, J, movefocus, d"
	"$mod, K, movefocus, u"

	"$mod, 1, workspace, 1"
	"$mod, 2, workspace, 2"
	"$mod, 3, workspace, 3"
	"$mod, 4, workspace, 4"
      ];
    };
  };
}
