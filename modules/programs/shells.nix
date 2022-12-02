{ pkgs, ... }:

let
  shellAliases = {
    ls = "ls --color";
    l  = "ls -al";
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake ~/dotfiles#desktop";
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

    zsh = {
      enable = true;
      inherit shellAliases;
      dotDir = ".config/zsh";
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
    };

    bash = {
      enable = true;
      inherit shellAliases;
    };
  };
}
