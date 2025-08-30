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
    ../darwin/modules/aerospace
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
