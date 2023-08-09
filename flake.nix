{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nur.url = "github:nix-community/NUR";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    unofficial-hyprland-plugins = {
      url = "github:arphe42/unofficial-hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nur, home-manager, hyprland, aagl, ... }:
    let
      user = "raphael";
      location = "$HOME/dotfiles";
    in {
      nixosConfigurations = (
          import ./hosts {
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs nur home-manager hyprland aagl user location;
          }
        );
      };
}
