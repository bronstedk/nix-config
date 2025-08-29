{pkgs, ...}: {
  services.sketchybar = {
    enable = true;
    config = let
      white = "0xffffffff";
      barColor = "0xff101314";
      itemBgColor = "0xff353c3f";
      accentColor = "0xffffffff";

      scripts = import ./scripts.nix {inherit pkgs;};

      bar = ''
        sketchybar --bar height=37 \
                         blur_radius=30   \
                         position=top     \
                         sticky=off       \
                         padding_left=10  \
                         padding_right=10 \
                         color=${barColor}
      '';

      default = ''
        sketchybar --default icon.font="SF Pro:Semibold:15.0" \
                             icon.color=${white} \
                             icon.padding_left=4 \
                             icon.padding_right=4 \
                             label.font="SF Pro:Semibold:15.0" \
                             label.color=${white} \
                             label.padding_left=4 \
                             label.padding_right=4 \
                             padding_left=5                    \
                             padding_right=5
      '';

      calendar = ''
        sketchybar --add item calendar right \
                   --set calendar icon=􀧞  \
                                  update_freq=20 \
                                  label="$(date +'%a %d %b %I:%M %p')" \
                                  script="${scripts.calendar}"
      '';

      volume = ''
        sketchybar --add item volume right \
                   --set volume script="${scripts.volume}" \
                   --subscribe volume volume_change
      '';

      battery = ''
        sketchybar --add item battery right \
                   --set battery update_freq=120 \
                                 script="${scripts.battery}" \
                   --subscribe battery system_woke power_source_change
      '';

      cpu = ''
        sketchybar --add item cpu right \
                   --set cpu  update_freq=2 \
                              icon=􀧓  \
                              script="${scripts.cpu}"
      '';

      frontApp = ''
        sketchybar --add item front_app left \
                   --set front_app       background.color=${accentColor} \
                                         icon.color=${barColor} \
                                         icon.font="sketchybar-app-font:Regular:16.0" \
                                         label.color=${barColor} \
                                         script="${scripts.frontApp}"            \
                   --subscribe front_app front_app_switched
      '';

      spaceByMonitor = ''
        sketchybar --add event aerospace_workspace_change

        sketchybar --add item space_by_monitor right \
                   --set space_by_monitor icon.drawing=off \
                                          label.color=${barColor}
                                          script="${scripts.spaceByMonitor}" \
                   --subscribe space_by_monitor aerospace_workspace_change
      '';

      aerospace = ''
        for sid in $(aerospace list-workspaces --all); do
            sketchybar --add item space.$sid left \
                --set space.$sid \
                icon=$sid \
                label.font="sketchybar-app-font:Regular:16.0" \
                label.padding_right=20 \
                label.y_offset=-1 \
                click_script="aerospace workspace $sid"
        done
      '';

      spaces = ''
        sketchybar --add item space_separator left                             \
                   --set space_separator icon="􀆊"                                \
                                         icon.color=${accentColor} \
                                         icon.padding_left=4                   \
                                         label.drawing=off                     \
                                         background.drawing=off                \
                                         script="${scripts.spaceWindows}" \
                   --subscribe space_separator aerospace_workspace_change
      '';

      media = ''
        sketchybar --add item media e \
                   --set media label.color=${accentColor} \
                               label.max_chars=20 \
                               icon.padding_left=0 \
                               scroll_texts=on \
                               icon=􀑪             \
                               icon.color=${accentColor}\
                               background.drawing=off \
                               script="${scripts.media}" \
                   --subscribe media media_change
      '';
    in ''
      #!/bin/bash

      ${bar}
      ${default}

      # -- Left Side Items --
      ${aerospace}
      ${spaces}
      ${frontApp}

      # -- Right Side Of Notch Items --
      ${media}

      # -- Right Side Items --
      ${calendar}
      ${volume}
      ${battery}
      ${cpu}
      ${spaceByMonitor}

      sketchybar --update
    '';
  };
}
