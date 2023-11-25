return {
    "folke/trouble.nvim",
    config = function()
        vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
            { silent = true, noremap = true }
        )
        require("trouble").setup { icons = true,     -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
}
