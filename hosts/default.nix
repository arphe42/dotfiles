{ lib, inputs, nixpkgs, nur, home-manager, hyprland, aagl, user, location, ... }:

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
      inherit inputs user location hyprland aagl;
      host = {
        hostName = "desktop";
      };
    };
    modules = [
      nur.nixosModules.nur
      ./desktop
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit inputs user hyprland;
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

  nas = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs user location;
      host = {
        hostName = "nas";
      };
    };
    modules = [
      ./nas
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit user;
          host = {
            hostName = "nas";
          };
        };
        home-manager.users.${user} = {
          imports = [
            (import ./home.nix)] ++ 
            [(import ./nas/home.nix)
          ];
        };
      }
    ];
  };
}
