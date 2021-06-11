require("utils")

local indent = 4

opt("b", "expandtab", true) -- Use spaces instead of tabs
opt("b", "shiftwidth", indent) -- Size of an indent
opt("b", "smartindent", true) -- Insert indents automatically
opt("b", "tabstop", indent) -- Number of spaces tabs count for
opt("o", "completeopt", "menuone,noselect") -- Completion options (for deoplete)
opt("o", "hidden", true) -- Enable modified buffers in background
opt("o", "ignorecase", true) -- Ignore case
opt("o", "joinspaces", false) -- No double spaces with join after a dot
opt("o", "scrolloff", 4) -- Lines of context
opt("o", "shiftround", true) -- Round indent
opt("o", "sidescrolloff", 8) -- Columns of context
opt("o", "smartcase", true) -- Don't ignore case with capitals
opt("o", "splitbelow", true) -- Put new windows below current
opt("o", "splitright", true) -- Put new windows right of current
opt("o", "termguicolors", true) -- True color support
opt("o", "wildmenu", true)
opt("o", "wildmode", "longest:full,full") -- Command-line completion mode
opt("w", "number", true) -- Print line number
opt("w", "relativenumber", true) -- Relative line numbers
opt("w", "wrap", false) -- Disable line wrap
opt("b", "autoindent", true)
opt("w", "cursorline", true)
opt("w", "cursorcolumn", true)
opt("w", "signcolumn", "yes")

-- Settings and functions to allow shift/shift-tab to move through completions
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        -- If <S-Tab> is not working in your terminal, change it to <C-h>
        return t "<S-Tab>"
    end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("n", "<Tab>", "<cmd>bn<cr>", {})
vim.api.nvim_set_keymap("n", "<S-Tab>", "<cmd>bp<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>d", "<cmd>BufferClose<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>CHADopen<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>lua require('telescope.builtin').tags()<cr>", {})

vim.g.gutentags_generate_on_write = true
vim.g.gutentags_generate_on_new = true
vim.g.gutentags_ctags_extra_args = {"--tag-relative=yes", "--fields=+ailmnS"}
