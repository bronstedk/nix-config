{lib, ...}: {
  nixpkgs.config.allowUnfree = true;
  home.username = "bronstedk";
  home.homeDirectory = lib.mkForce "/Users/bronstedk";
  home.stateVersion = "25.05";

  #  home.packages = let
  #    rest = import ../shared/packages.nix {inherit pkgs;};
  #  in
  #    rest;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  imports = [
    ./modules
    ../secrets/gpg.nix
  ];

  programs.home-manager.enable = true;
}
