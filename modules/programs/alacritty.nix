{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      window.opacity = 0.7;
      window.blur = true;
    };
  };
}
