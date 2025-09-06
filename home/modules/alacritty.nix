{...}: {
  programs.alacritty = {
    enable = true;

    theme = "catppuccin_mocha";

    settings = {
      env = {
        TERM = "xterm-256color";
      };

      font = {
        size = 14.0;

        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };

        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };

        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };

        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
      };
    };
  };
}
