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
        nvim-lspconfig
        nvim-cmp

        dashboard-nvim
        telescope-nvim

        vim-floaterm

        # theme
        catppuccin-nvim
      ];
      extraConfig = ''
        luafile '' + ./. + ''/settings.lua
        syntax enable
        highlight Comment cterm=italic gui=italic
        hi Normal guibg=NONE ctermbg=NONE

        set number
        set relativenumber
        set clipboard=unnamedplus

        nmap <F6> :NvimTreeToggle<CR>
      '';
      
    };
  };
}
