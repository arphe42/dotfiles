{ pkgs, ... }:

let
  shellAliases = {
    ls = "ls --color";
    l  = "ls -al";
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake ~/dotfiles#desktop";
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
      enableSyntaxHighlighting = true;
    };

    bash = {
      enable = true;
      inherit shellAliases;
    };
  };
}
