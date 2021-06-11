vim.g.mapleader = ";"

require("settings")
require("plugins")
require("lsp")
require("statusline")
require("treesitter")

vim.cmd [[ colorscheme gruvbox-flat ]]
