{ pkgs, ... }:

let 
  aagl-gtk-on-nix = import (builtins.fetchTarball {
    url = "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz";
    sha256 = "sha256:03ir7006fhjxh7drgczlv789qwh0ngc82jgkfs7szicag3fr2hjs";
  }){ inherit pkgs; };
in
{
  home.packages = [ aagl-gtk-on-nix.an-anime-game-launcher ];
}
