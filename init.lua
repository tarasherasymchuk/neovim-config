vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set termguicolors")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

require("lazy").setup("plugins")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal left<CR>", {})

require("catppuccin").setup({
  flavour = "frappe"
})
vim.cmd.colorscheme "catppuccin"

local tsconfig = require("nvim-treesitter.configs")
tsconfig.setup({
  ensure_installed = {"lua", "java", "python", "javascript", "sql", "rust", "go"},
  highlight = { enable = true },
  indent = { enable = true }, 
})

