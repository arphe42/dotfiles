{ config, pkgs, lib, aagl, ... }:

{
  imports = [ aagl.nixosModules.default ];
  nix.settings = aagl.nixConfig; # Set up Cachix
  programs.anime-game-launcher.enable = true;
}
