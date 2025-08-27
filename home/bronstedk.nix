{ pkgs, lib, ... }:
{
nixpkgs.config.allowUnfree = true;
  home.username = "bronstedk";
  home.homeDirectory = lib.mkForce "/Users/bronstedk";
  home.stateVersion = "25.05";
  
  home.packages = [
	pkgs.ripgrep
	pkgs.raycast
        pkgs.wezterm
        pkgs.fzf
        pkgs.eza
	pkgs.neovim
	pkgs.bitwarden
  ];

  home.sessionVariables = {
     EDITOR = "nvim";
  };

  imports = [
../shared/modules/nvim.nix
../shared/modules/zsh.nix
../shared/modules/jj.nix
../secrets/gpg.nix
../darwin/modules/aerospace.nix
  ];

  programs.atuin = {
  	enable = true;
	enableZshIntegration = true;
	enableNushellIntegration = true;
	enableBashIntegration = true;
  };

  programs.home-manager.enable = true;
}
