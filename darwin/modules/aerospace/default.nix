{
  lib,
  pkgs,
  ...
}: {
  programs.aerospace = lib.mkIf pkgs.stdenv.isDarwin {
    enable = true;
    launchd.enable = true;

    userSettings = {
      #      after-startup-command = [
      #        "exec-and-forget sketchybar"
      #      ];

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
      ];

      automatically-unhide-macos-hidden-apps = false;

      gaps = {
        inner = {
          horizontal = 5;
          vertical = 5;
        };

        outer = {
          left = 5;
          right = 5;
          bottom = 5;
          top = [{monitor."Built-in Retina Display" = 10;} (37 + 5)];
        };
      };

      workspace-to-monitor-force-assignment = {
        "1" = ["KA242Y E" "secondary"];
      };

      on-window-detected = [
        {
          "if".app-id = "com.apple.systempreferences";
          run = ["layout tiling"];
        }
        {
          "if".app-id = "com.vivaldi.Vivaldi";
          run = ["move-node-to-workspace 1"];
        }
        {
          "if".app-id = "com.todoist.mac.Todoist";
          run = ["move-node-to-workspace 3"];
        }
        {
          "if".app-id = "com.github.wez.wezterm";
          run = ["move-node-to-workspace 2"];
        }
      ];

      mode = {
        main.binding = {
          alt-j = "focus down";
          alt-k = "focus up";
          alt-l = "focus right";
          alt-h = "focus left";

          alt-shift-j = "move down";
          alt-shift-k = "move up";
          alt-shift-l = "move right";
          alt-shift-h = "move left";

          alt-semicolon = "join-with right";
          alt-v = "join-with down";

          alt-f = "fullscreen";

          alt-s = "layout v_accordion";
          alt-w = "layout h_accordion";
          alt-e = "layout tiles horizontal vertical";

          alt-shift-space = "layout floating tiling";

          alt-1 = "workspace 1";
          alt-2 = "workspace 2";
          alt-3 = "workspace 3";

          alt-shift-1 = [
            "move-node-to-workspace 1"
            "exec-and-forget sketchybar --trigger workspace_move PREV_WORKSPACE=1"
          ];
          alt-shift-2 = [
            "move-node-to-workspace 2"
            "exec-and-forget sketchybar --trigger workspace_move PREV_WORKSPACE=2"
          ];
          alt-shift-3 = [
            "move-node-to-workspace 3"
            "exec-and-forget sketchybar --trigger workspace_move PREV_WORKSPACE=3"
          ];

          alt-tab = "workspace-back-and-forth";
          alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

          alt-shift-semicolon = [
            "mode service"
            "exec-and-forget sketchybar --trigger change_mode MODE=service"
          ];

          alt-shift-c = [
            "reload-config"
            #           "exec-and-forget killall sketchybar; sketchybar"
          ];

          alt-r = [
            "mode resize"
            "exec-and-forget sketchybar --trigger change_mode MODE=resize"
          ];
        };

        resize.binding = {
          h = "resize width -50";
          j = "resize height +50";
          k = "resize height -50";
          l = "resize width +50";
          b = [
            "balance-sizes"
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];

          enter = [
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];
        };

        service.binding = {
          enter = [
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];
          r = [
            "flatten-workspace-tree"
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];

          alt-shift-h = [
            "join-with left"
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];
          alt-shift-j = [
            "join-with down"
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];
          alt-shift-k = [
            "join-with up"
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];
          alt-shift-l = [
            "join-with right"
            "mode main"
            "exec-and-forget sketchybar --trigger change_mode MODE=main"
          ];
        };
      };
    };
  };
}
