{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.username = "bronstedk";
  home.homeDirectory = lib.mkForce "/Users/bronstedk";
  home.stateVersion = "25.05";

  home.packages = [
    pkgs.bitwarden
    pkgs.lua
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.file = lib.optionalAttrs pkgs.stdenv.isDarwin {
    ".config/sketchybar" = {
      source = ../external/sketchybar;
      recursive = true;
    };
  };

  imports = [
    ../shared/modules/nvim
    ../shared/modules/zsh.nix
    ../shared/modules/oh-my-posh.nix
    ../shared/modules/wezterm.nix
    ../shared/modules/yazi.nix
    ../shared/modules/jj.nix
    ../shared/modules/gh.nix
    ../secrets/gpg.nix
  ];

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };

  programs.home-manager.enable = true;
}
