{ config, lib, pkgs, user, ... }:

{
  imports = [
    ../modules/programs/shells.nix
  ];

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
      lazygit
      tree

      xscreensaver
      numlockx
      picom
      playerctl
      pamixer   #audio control for pulseaudio

      qpwgraph
      pulsemixer
      feh
      xdotool
      lxsession
      rofi
      alacritty
      firefox
      vscode
    ];
    stateVersion = "22.11";
  };

  programs = {

    home-manager.enable = true;

    bat.enable = true;

    #git = {
    #  enable = true;
    #  userName = "arphe42";
    #  userEmail = "arphe42@gmail.com";
    #};

    tmux = {
      enable = true;
      extraConfig = ''
        set -g mouse on
      '';
    };

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
