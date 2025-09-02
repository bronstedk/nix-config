{...}: {
  plugins.tiny-inline-diagnostic = {
    enable = true;

    settings = {
      preset = "modern";

      show_source = {
        enabled = true;
        if_many = true;
      };

      use_icons_from_diagnostic = true;

      multilines.enabled = true;

      enable_on_insert = true;
      throttle = 0;

      overflow.mode = "wrap";
    };
  };
}
