{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    nur.url = "github:nix-community/NUR";

    sudoku-resolv = {
      url = "path:/home/raphael/Documents/projets/sudoku_resolver";
      flake = true;
      #inputs.nixpkgs.follows = "nixpkgs";
    };
    myApps = {
      url = "path:/home/raphael/Documents/projets/nixpkgsExemple";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix.url = "github:the-argus/spicetify-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { self, nixpkgs, nur, home-manager, hyprland, aagl, spicetify-nix, ... }:
    let
      user = "raphael";
      location = "$HOME/dotfiles";
    in {
      nixosConfigurations = (
          import ./hosts {
            inherit (nixpkgs) lib;
            inherit inputs nixpkgs nur home-manager hyprland aagl user location spicetify-nix;
          }
        );
      };
}
