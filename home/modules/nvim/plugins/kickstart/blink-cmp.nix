{...}: {
  plugins.luasnip.enable = true;

  plugins.blink-cmp = {
    enable = true;

    settings = {
      keymap = {
        preset = "default";
      };

      appearance = {
        nerd_font_variant = "mono";
      };

      completion = {
        documentation = {
          auto_show = true;
          auto_show_delay_ms = 500;
        };
      };

      sources = {
        default = [
          "lsp"
          "path"
          "snippets"
          "lazydev"
        ];

        providers = {
          lazydev = {
            module = "lazydev.integrations.blink";
            score_offset = 100;
          };
        };
      };

      snippets = {
        preset = "luasnip";
      };

      fuzzy = {
        implementation = "lua";
      };

      signature = {
        enabled = true;
      };
    };
  };
}
