{ pkgs, ... }:

let 
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "sha256:01fb3ry9bgqzqrzkrxg8zc7r4sp9crbfh54z9slhdkljm754d82j";
  }){ inherit pkgs; };
in
{
  home.packages = [ aagl-gtk-on-nix.an-anime-game-launcher ];
}
