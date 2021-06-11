local npairs = require("nvim-autopairs")

npairs.setup(
    {
        check_ts = true
    }
)

require "nvim-treesitter.configs".setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    },
    autopairs = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["iP"] = "@parameter.inner",
                ["aP"] = "@parameter.outer",
                ["il"] = "@block.inner",
                ["al"] = "@block.outer",
                ["am"] = "@comment.outer",
                ["iC"] = "@call.inner",
                ["aC"] = "@call.outer",
                ["io"] = "@conditional.inner",
                ["ao"] = "@conditional.outer"
            }
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner"
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer"
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer"
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer"
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer"
            }
        },
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["df"] = "@function.outer",
                ["dF"] = "@class.outer"
            }
        }
    }
}
