{...}: {
  plugins.trouble = {
    enable = true;

    settings = {
      keys = {
        "<leader>xx" = {
          action = "<cmd>Trouble diagnostics toggle<cr>";
          desc = "Diagnostics (Trouble)";
        };

        "<leader>xX" = {
          action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
          desc = "Buffer Diagnostics (Trouble)";
        };

        "<leader>cs" = {
          action = "<cmd>Trouble symbols toggle focus=false<cr>";
          desc = "Symbols (Trouble)";
        };

        "<leader>cl" = {
          action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
          desc = "LSP Definitions / references / ... (Trouble)";
        };

        "<leader>xL" = {
          action = "<cmd>Trouble loclist toggle<cr>";
          desc = "Location List (Trouble)";
        };

        "<leader>xQ" = {
          action = "<cmd>Trouble qflist toggle<cr>";
          desc = "Quickfix List (Trouble)";
        };
      };
    };
  };
}
