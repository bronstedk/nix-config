{
  pkgs,
  self,
  ...
}: {
  # specialArgs = { inherit inputs; };
  imports = [
    ./modules/homebrew.nix
    ./modules/aerospace/jankyborders.nix
    ./modules/system.nix
  ];

  # List packages installed in system profile. To search by name, run:
  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = ["/share/zsh"];
  environment.systemPackages = let
    rest = import ../shared/packages.nix {inherit pkgs;};
  in
    [
      pkgs.raycast
      pkgs.mkalias
    ]
    ++ rest;

  fonts.packages = let
    sharedFonts = import ../shared/fonts.nix {inherit pkgs;};
  in
    [
      pkgs.sketchybar-app-font
    ]
    ++ sharedFonts;

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

  # Set Git commit hash for darwin-version.
  system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";
}
