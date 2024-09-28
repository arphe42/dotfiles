{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;

      extraConfig = ''
        luafile '' + ./. + ''/settings.lua
        luafile '' + ./. + ''/remap.lua
        luafile '' + ./. + ''/plugins/treesitter.lua
        source '' + ./. + ''/plugins/floaterm.vim

lua << EOF
vim.defer_fn(function()
  vim.cmd [[
    luafile '' + ./. + ''/plugins/lsp.lua
  ]]
end, 70)
EOF
      '';

      plugins = with pkgs.vimPlugins; [
        # File Tree
        nvim-web-devicons
        nvim-tree-lua

        # LSP
        nvim-lspconfig
        nvim-compe
        #nvim-cmp
        #cmp-nvim-lsp
        rust-tools-nvim

        # Eyecandy
        nvim-treesitter.withAllGrammars


        barbar-nvim
        gitsigns-nvim

        telescope-nvim

        vim-gitgutter
        vim-floaterm

        vim-nix
        indentLine
	    auto-pairs
      ];
    };
  };

  home.packages = with pkgs; [
    #rnix-lsp
    lua-language-server
    rust-analyzer
  ];
}
