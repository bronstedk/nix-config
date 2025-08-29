{...}: {
  programs.nushell = {
    enable = true;

    shellAliases = {
      c = "clear";
    };

    settings = {
      show_banner = false;

      history = {
        format = "sqlite";
      };

      completions.external = {
        enable = true;
      };
    };
  };
}
