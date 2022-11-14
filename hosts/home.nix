{ config, lib, pkgs, user, ... }:

{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # terminal
      btop
      ranger
      pfetch
      git
      gh

      xscreensaver
      numlockx
      picom

      qpwgraph
      pulsemixer
      feh
      xdotool
      lxsession
      rofi
      alacritty
      firefox
    ];
    stateVersion = "22.11";
  };

  programs = {

    home-manager.enable = true;

    bat.enable = true;

    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        # Syntax
        vim-nix

        # Quality of life
        auto-pairs         # Print double quotes/brackets/etc.
        vim-gitgutter      # See uncommitted changes of file :GitGutterEnable

        # File Tree
        nerdtree

        # Customization
        lightline-vim
        indent-blankline-nvim
      ];
      extraConfig = ''
        syntax enable
        highlight Comment cterm=italic gui=italic   " Comments become italic
        hi Normal guibg=NONE ctermbg=NONE           " Remove background, better for personal theme

        set number

        nmap <F6> :NERDTreeToggle<CR>               " F6 opens NERDTree
      '';
    };
  };
}
