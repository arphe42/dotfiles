local g = vim.g

g.mapleader = " "

vim.keymap.set("n", "<f6>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
