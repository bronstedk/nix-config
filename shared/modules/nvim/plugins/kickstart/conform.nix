{pkgs, ...}: {
  extraPackages = with pkgs; [
    stylua
  ];

  plugins.conform-nvim = {
    enable = true;

    settings = {
      notify_on_error = true;
      format_on_save = ''
        function(bufnr)
          -- Disable "format_on_save lsp_fallback" for lanuages that don't
          -- have a well standardized coding style. You can add additional
          -- lanuages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          if disable_filetypes[vim.bo[bufnr].filetype] then
            return nil
          else
            return {
              timeout_ms = 500,
              lsp_format = "fallback",
            }
          end
        end
      '';

      formatters_by_ft = {
        lua = ["stylua"];
        python = ["isort" "pyink"];
        go = ["gofumpt" "goimports" "golangci-lint"];
        tex = ["tex-fmt"];
        bib = ["bibtex-tidy"];
        java = ["google-java-format"];
        kotlin = ["ktlint" "ktfmt"];
        markdown = ["markdownfmt"];
        nix = ["alejandra" "nixpkgs_fmt"];
        json = ["fixjson"];
        zig = ["zigfmt"];
        "['_']" = ["codespell" "trim_whitespace"];
      };
    };
  };

  keymaps = [
    {
      mode = "";
      key = "<leader>f";
      action.__raw = ''
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end
      '';
      options = {
        desc = "[F]ormat buffer";
      };
    }
  ];
}
