{ pkgs, ... }:

{
  programs = {
    neovim = {
      enable = true;

      extraConfig = ''
        luafile '' + ./. + ''/settings.lua
        luafile '' + ./. + ''/remap.lua
        luafile '' + ./. + ''/plugins/treesitter.lua

        lua << EOF
        vim.defer_fn(function()
          vim.cmd [[
            luafile '' + ./. + ''/plugins/lsp.lua
          ]]
        )
      '';

      plugins = with pkgs.vimPlugins; [
        # File Tree
        nvim-web-devicons
        nvim-tree-lua

        # LSP
        nvim-lspconfig
        nvim-compe
        lsp-zero-nvim
        rust-tools-nvim

        # Eyecandy
        nvim-treesitter.withAllGrammars


        barbar-nvim
        gitsigns-nvim
        nvim-cmp

        telescope-nvim

        vim-gitgutter
        vim-floaterm

        vim-nix
        indentLine
	    auto-pairs

        # theme
        catppuccin-nvim
      ];
    };
  };

  home.packages = with pkgs; [
    rnix-lsp
  ];
}
