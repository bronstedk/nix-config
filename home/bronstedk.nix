{
  lib,
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.username = "bronstedk";
  home.homeDirectory = let
    home =
      if pkgs.stdenv.isDarwin
      then "/Users/bronstedk"
      else "/home/bronstedk";
  in
    lib.mkForce home;
  home.stateVersion = "25.05";

  #  home.packages = let
  #    rest = import ../shared/packages.nix {inherit pkgs;};
  #  in
  #    rest;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ../shared/modules/stylix.nix
    ./modules
    ../nixos/modules/hyprland.nix
    ../nixos/modules/waybar
  ];

  programs.home-manager.enable = true;
}
