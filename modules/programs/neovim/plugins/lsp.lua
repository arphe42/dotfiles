-- This file sets up autocompletion for neovim's native lsp

-- This enable all the language servers wanted
require'lspconfig'.rnix.setup{}

vim.o.completeopt = "menuone,noselect"

-- Autocompletion setup
require'compe'.setup {
    enable = true;
    autocomplete = true;
    debug = fale;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        buffer = true;
        nvim_lsp = true;
        nvim_lua = true;
        tags = true;
        treesitter = true;
    };
}

-- Set tab to accept the autocompletion
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    else
        return t "<S-Tab>"
    end
end
