{
  description = "bronstedk MacOS and NixOS system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.05-darwin";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nix-darwin = {
    	url = "github:nix-darwin/nix-darwin/nix-darwin-25.05";
    	inputs.nixpkgs.follows = "nixpkgs";
    };

	home-manager = { 
		url = "github:nix-community/home-manager/release-25.05";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	nixvim = {
		url = "github:nix-community/nixvim/nixos-25.05";		
		inputs.nixpkgs.follows = "nixpkgs";
              };
              flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager, nix-homebrew, nixvim, ... }:
  {
    darwinConfigurations.macbook = nix-darwin.lib.darwinSystem {
    specialArgs = { inherit self; };
      system = "aarch64-darwin";
                                modules = [ 
      ./darwin/configuration.nix
nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              enable = true;
              enableRosetta = true;
              user = "bronstedk";
            };
          }
                                         home-manager.darwinModules.home-manager {
 home-manager.useUserPackages = true;
 home-manager.users.bronstedk = {pkgs, ...}: {
 imports = [ 
 nixvim.homeModules.nixvim
 ./home/bronstedk.nix 
 ]; 
 };
                                         }

      ];
    };

#     nixosConfigurations = {
# laptop = nixpkgs.lib.nixosSystem {
# system = "x86_64-linux";
#                                         modules = [
#                                                  ./nixos/configurations.nix
#                                                 home-manager.nixosModules.home-manager {
# home-manager.useUserPackages = true;
#                                                          home-manager.users.bronstedk = import ./home/bronstedk.nix;
#                                                 }
#                                         ];
# };
#     };
  };
}
