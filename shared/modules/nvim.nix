{pkgs, ...}: {
  programs.nixvim = {
    enable = true;

    imports = [
      ./nvim
    ];

    colorschemes.catppuccin.enable = true;
    plugins = {
      lualine.enable = true;
      guess-indent.enable = true;
      web-devicons.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-nix
    ];
  };
}
