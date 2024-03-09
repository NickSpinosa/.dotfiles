return {
    "akinsho/toggleterm.nvim",
    lazy = false,
    config = function()
        local tt = require('toggleterm')
        tt.setup({
            size = 20,
            direction = 'float',
            open_mapping = [[<C-t>]],
            start_in_insert = false
        })
    end
}
