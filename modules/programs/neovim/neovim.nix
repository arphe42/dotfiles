{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        # Syntax
        vim-nix

	auto-pairs
	vim-gitgutter
        indentLine

        # File Tree
        nvim-web-devicons
        nvim-tree-lua
        nerdtree

        nvim-treesitter
        nvim-lspconfig
        nvim-cmp
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
