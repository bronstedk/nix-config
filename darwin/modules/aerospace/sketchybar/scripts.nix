{pkgs, ...}: let
  white = "0xffffffff";
  barColor = "0xff101314";
  itemBgColor = "0xff353c3f";
  accentColor = "0xffffffff";

  script = {
    name,
    text,
  }:
    pkgs.writeShellScript name text;

  iconMap = import ./iconMap.nix {inherit script;};
in {
  calendar = script {
    name = "calendar.sh";
    text = ''
      #!/bin/bash

      sketchybar --set $NAME label="$(date +'%a %d %b %I:%M %p')"
    '';
  };

  volume = script {
    name = "volume.sh";
    text = ''
      #!/bin/sh

      # The volume_change event supplies a $INFO variable in which the current volume
      # percentage is passed to the script.

      if [ "$SENDER" = "volume_change" ]; then
        VOLUME=$INFO

        case $VOLUME in
          [6-9][0-9]|100) ICON="􀊩"
          ;;
          [3-5][0-9]) ICON="􀊥"
          ;;
          [1-9]|[1-2][0-9]) ICON="􀊡"
          ;;
          *) ICON="􀊣"
        esac

        sketchybar --set $NAME icon="$ICON" label="$VOLUME%"
      fi
    '';
  };

  battery = script {
    name = "battery.sh";
    text = ''
      #!/bin/sh

      PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
      CHARGING=$(pmset -g batt | grep 'AC Power')

      if [ $PERCENTAGE = "" ]; then
        exit 0
      fi

      case ''${PERCENTAGE} in
        9[0-9]|100) ICON="􀛨"
        ;;
        [6-8][0-9]) ICON="􀺸"
        ;;
        [3-5][0-9]) ICON="􀺶"
        ;;
        [1-2][0-9]) ICON="􀛩"
        ;;
        *) ICON="􀛪"
      esac

      if [[ $CHARGING != "" ]]; then
        ICON="􀢋"
      fi

      # The item invoking this script (name $NAME) will get its icon and label
      # updated with the current battery status
      sketchybar --set $NAME icon="$ICON" label="''${PERCENTAGE}%"
    '';
  };

  cpu = script {
    name = "cpu.sh";
    text = ''
      #!/bin/bash

      CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
      CPU_INFO=$(ps -eo pcpu,user)
      CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
      CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

      CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

      sketchybar --set $NAME label="$CPU_PERCENT%"
    '';
  };

  iconMap = iconMap;

  frontApp = script {
    name = "front_app.sh";
    text = ''
      #!/bin/sh

      # Some events send additional information specific to the event in the $INFO
      # variable. E.g. the front_app_switched event sends the name of the newly
      # focused application in the $INFO variable:
      # https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

      if [ "$SENDER" = "front_app_switched" ]; then
        sketchybar --set $NAME label="$INFO" icon="$(${iconMap} "$INFO")"
      fi
    '';
  };

  aerospace = script {
    name = "aerospace.sh";
    text = ''
      #!/usr/bin/env bash

      if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
          sketchybar --set $NAME background.drawing=on
                                 background.color=${accentColor} \
                                 label.color=${barColor} \
                                 icon.color=${barColor}
      else
          sketchybar --set $NAME background.drawing=off
                                 label.color=${accentColor} \
                                 icon.color=${accentColor}
      fi
    '';
  };

  spaceWindows = script {
    name = "space_windows.sh";
    text = ''
      #!/bin/bash

      if [ "$SENDER" = "space_windows_change" ]; then
        space="$(echo "$INFO" | jq -r '.space')"
        apps="$(echo "$INFO" | jq -r '.apps | keys[]')"

        icon_strip=" "
        if [ "''${apps}" != "" ]; then
          while read -r app
          do
            icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
          done <<< "''${apps}"
        else
          icon_strip=" —"
        fi

        sketchybar --set space.$space label="$icon_strip"
      fi
    '';
  };

  media = script {
    name = "media.sh";
    text = ''
      #!/bin/bash

      STATE="$(echo "$INFO" | jq -r '.state')"
      if [ "$STATE" = "playing" ]; then
        MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
        sketchybar --set $NAME label="$MEDIA" drawing=on
      else
        sketchybar --set $NAME drawing=off
      fi
    '';
  };
}
