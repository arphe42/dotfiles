{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      cemu
      yuzu-mainline
    ];
  };
}
