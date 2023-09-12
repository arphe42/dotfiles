{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
	    auto-pairs
	    vim-gitgutter
        indentLine

        # File Tree
        nvim-web-devicons
        nvim-tree-lua
        nerdtree

        #languages
        lsp-zero-nvim
        nvim-lspconfig
        rust-tools-nvim
        vim-nix


        barbar-nvim
        gitsigns-nvim
        nvim-treesitter.withAllGrammars
        nvim-cmp

        dashboard-nvim
        telescope-nvim

        vim-floaterm

        # theme
        catppuccin-nvim
      ];
      extraConfig = ''
        luafile '' + ./. + ''/settings.lua
        luafile '' + ./. + ''/remap.lua
        luafile '' + ./. + ''/plugins/treesitter.lua
        highlight Comment cterm=italic gui=italic
        hi Normal guibg=NONE ctermbg=NONE
      '';
      
    };
  };
}
