{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      # linux
      bash
      ssh_config

      # sway
      tmux

      # Nix, Nixvim
      nix
      query # treesitter queries
      vim
      vimdoc
      lua
      luadoc

      # General Development
      csv
      diff
      editorconfig
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      ini
      llvm
      markdown
      markdown_inline
      regex
      xml
      yaml

      rust
      toml

      css
      html
      http
      javascript
      json
      json5
      php
      php_only
      phpdoc
      sql
      scss
      twig
      tsx
      typescript

      astro
      nginx
      svelte
    ];

    settings = {
      ensureInstalled = [];
      additional_vim_regex_highlighting = [
        "ruby"
      ];

      indent = {
        enable = true;
        disable = [
          "ruby"
        ];
      };
    };
  };
}
