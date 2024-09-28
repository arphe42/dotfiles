{ pkgs, host, ... }:

let
  shellAliases = {
    ls = "ls --color";
    l  = "ls -al";
    ll = "ls -l";
    rebuild = "doas nixos-rebuild switch --flake ~/dotfiles#${host.hostName}";
    update = "pushd ~/dotfiles; nix flake update; popd";
    ".." = "cd ..";
  };

  #initExtra = with host;
  #  if hostName == "desktop" then ''
  #    if [ -z "''${DISPLAY}" ] && [ "''${XDG_VTNR}" -eq 1 ]; then
  #      exec Hyprland
  #    fi
  #  '' else "";
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
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      #inherit initExtra;
    };

    bash = {
      enable = true;
      inherit shellAliases;
    };
  };
}
