local function LspStatus()
    local clients = vim.lsp.buf_get_clients()
    if next(clients) ~= nil then
        local return_string = " "
        local clients = vim.lsp.get_active_clients() 
        for i, client in next, clients do
            return_string = return_string .. client.name
            if next(clients, i) ~= nil then
                return_string = return_string .. " -- "
            end
        end
        return return_string
    else
        return ""
    end
end

require("lualine").setup {
    options = {
        icons_enabled = true,
        theme = "gruvbox-flat",
        component_separators = {"", ""},
        section_separators = {"", ""},
        disabled_filetypes = {}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {"filename", LspStatus, {"diagnostics", sources = {"nvim_lsp"}, sections = {"error", "warn", "info", "hint"}}},
        lualine_x = {"encoding", "fileformat", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {"chadtree", "nvim-tree"}
}
