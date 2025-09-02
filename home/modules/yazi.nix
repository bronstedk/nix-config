{...}: {
  programs.yazi = {
    enable = true;

    enableBashIntegration = true;
    enableNushellIntegration = true;
    enableZshIntegration = true;

    settings = {
      mgr = {
        show_hidden = true;
        show_symlink = true;
      };
    };
  };
}
