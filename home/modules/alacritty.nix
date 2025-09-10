{...}: {
  programs.alacritty = {
    enable = true;

    # theme = "catppuccin_mocha";

    settings = {
      env = {
        TERM = "xterm-256color";
      };
    };
  };
}
