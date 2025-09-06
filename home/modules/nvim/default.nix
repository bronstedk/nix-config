{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    enable = true;

    imports = [
      ./autocmds.nix
      ./diagnostic.nix
      ./keymaps.nix
      ./options.nix
      ./plugins
    ];

    colorschemes.catppuccin = {
      enable = true;

      settings.flavour = "mocha";
    };

    clipboard.providers.wl-copy.enable = lib.mkIf pkgs.stdenv.isLinux true;

    plugins = {
      lualine.enable = true;
      guess-indent.enable = true;
      web-devicons.enable = true;
      numbertoggle.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };
}
