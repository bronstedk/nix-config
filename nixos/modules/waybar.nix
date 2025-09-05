{lib, pkgs, ...}: {
  programs.waybar = lib.mkIf pkgs.stdenv.isLinux {
    enable = true;

    settings.mainBar = {
      height = 30;
      spacing = 4;

      modules-left = [
	"sway/workspaces"
	"sway/mode"
	"sway/scratchpad"
	"custom/media"
      ];

      modules-center = [
	"sway/window"
      ];

      modules-right = [
	
      ];
    };
  };
}
