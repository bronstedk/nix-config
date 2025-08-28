{...}: {
  services.sketchybar = {
    enable = true;
    config = let
      white = "0xffffffff";
      barColor = "0xff101314";
      itemBgColor = "0xff353c3f";
      accentColor = "0xffffffff";

      bar = ''
        sketchybar --bar height=37 \
                         blur_radius=30 \
                         position=top \
                         sticky=off \
                         padding_left=10 \
                         padding_right=10 \
                         color=${barColor}
      '';
      default = ''
        sketchybar --default icon.font="SF Pro:Semibold:15.0" \
                             icon.color=${white} \
                             label.font="SF Pro:Semibold:15.0" \
                             label.color=${white} \
                             background.color=${itemBgColor} \
                             background.corner_radius=5 \
                             background.height=24 \
                             padding_left=5 \
                             padding_right=5 \
                             label.padding_left=4 \
                             label.padding_right=10 \
                             icon.padding_left=10 \
                             icon.padding_right=4
      '';

      calendar = ''
        sketchybar --add item calendar right \
                   --set calendar icon=􀧞 \
                                  update_freq=30
                                  script="${./calendar.sh}"
      '';
    in ''
      #!/bin/bash

      ${bar}

      ${default}

      # --- Right Side Items ---

      ${calendar}

      sketchybar --update
    '';
  };
}
