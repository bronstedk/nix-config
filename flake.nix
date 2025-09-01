{
  description = "bronstedk MacOS and NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nix-darwin,
    nixpkgs,
    home-manager,
    nix-homebrew,
    nixvim,
    ...
  }: let
    brewDarwin = nix-homebrew.darwinModules.nix-homebrew {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = "bronstedk";
      };
    };

    homeDarwin = home-manager.darwinModules.home-manager {
      home-manager.useUserPackages = true;
      home-manager.users.bronstedk = {...}: {
        imports = [
          nixvim.homeModules.nixvim
          ./home/bronstedk.nix
        ];
      };
    };

    homeNixos = home-manager.nixosModules.home-manager {
      home-manager.useUserPackages = true;
      home-manager.users.bronstedk = import ./home/bronstedk.nix;
    };
  in {
    darwinConfigurations.macbook = nix-darwin.lib.darwinSystem {
      specialArgs = {inherit self;};
      system = "aarch64-darwin";
      modules = [
        ./darwin/configuration.nix
        brewDarwin
        homeDarwin
      ];
    };

    nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./nixos/configurations.nix
        homeNixos
      ];
    };
  };
}
