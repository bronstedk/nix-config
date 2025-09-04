{...}: {
  programs.nushell = {
    enable = true;

    shellAliases = {
      c = "clear";
    };

    settings = {
      show_banner = false;

      history = {
        file_format = "sqlite";
        sync_on_enter = true;
      };

      buffer_editor = "nvim";

      edit_mode = "vi";

      completions.external = {
        enable = true;
      };
    };
  };
}
