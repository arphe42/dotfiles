{ pkgs, ... }:

let
  shellAliases = {
    ls = "ls --color";
    l  = "ls -al";
    ll = "ls -l";
    rebuild = "doas nixos-rebuild switch --flake ~/dotfiles#desktop";
    update = "pushd ~/dotfiles; nix flake update; popd";
    ".." = "cd ..";
  };
in
{
  programs = {
    starship = {
      enable = true;
      settings = {
        add_newline = false;
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;
      inherit shellAliases;
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      initExtra = ''
      if [ -z "''${DISPLAY}" ] && [ "''${XDG_VTNR}" -eq 1 ]; then
        exec Hyprland
      fi
      '';
    };

    bash = {
      enable = true;
      inherit shellAliases;
    };
  };
}
