{ lib, inputs, nixpkgs, home-manager, spicetify-nix, user, location, ... }:

let
  system = "x86_64-linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in

{
  desktop = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs user location ;
      host = {
        hostName = "desktop";
      };
    };
    modules = [
      ./desktop
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit inputs user spicetify-nix;
          host = {
            hostName = "desktop";
          };
        };
        home-manager.users.${user} = {
          imports = [
            (import ./home.nix)] ++ 
            [(import ./desktop/home.nix)
          ];
        };
      }
    ];
  };
}
