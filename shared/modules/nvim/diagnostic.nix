{...}: {
  diagnostic = {
    settings = {
      severity_sort = true;

      float = {
        border = "rounded";
        source = "if_many";
      };

      underline = {
        severity.__raw = ''vim.diagnostic.severity.ERROR'';
      };

      signs.__raw = ''
        vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {}
      '';

      virtual_text = false;
    };
  };
}
