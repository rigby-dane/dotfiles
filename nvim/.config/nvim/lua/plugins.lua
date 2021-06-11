vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
    function()
        use "wbthomason/packer.nvim"

        use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
        use {"eddyekofo94/gruvbox-flat.nvim"}

        use {"neovim/nvim-lspconfig"}
        use {"hrsh7th/nvim-compe"}
        use {"glepnir/lspsaga.nvim"}

        use {"ms-jpq/chadtree", branch = "chad", run = "python3 -m chadtree deps"}
        use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
        use {"ludovicchabant/vim-gutentags"}
        use {"hrsh7th/vim-vsnip"}
        use {"windwp/nvim-autopairs"}
        use {"windwp/nvim-ts-autotag"}
        use {"romgrk/barbar.nvim"}
        use {"machakann/vim-sandwich"}
        use {"nvim-treesitter/nvim-treesitter-textobjects"}
        use {"hoob3rt/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
        use {"sbdchd/neoformat"}
        use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}
    end
)
