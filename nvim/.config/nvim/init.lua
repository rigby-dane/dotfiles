vim.g.mapleader = ";"

require("settings")
require("plugins")
require("lsp")
require("statusline")
require("treesitter")

vim.cmd [[ colorscheme gruvbox-flat ]]
vim.g.gruvbox_flat_style = "dark"
