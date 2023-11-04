local ntest = require("neotest")

ntest.setup({
    adapters = {

        require("neotest-vim-test")({
            ignore_file_types = { "python", "vim", "lua" },
            allow_file_types = { "javascript", "typescript" }
        }),

        require("neotest-playwright").adapter({
            options = {
                persist_project_selection = true,
                enable_dynamic_test_discovery = true,
                preset = "debug",
            }
        }),

    },
})

vim.keymap.set("n", "<leader>tt", function() ntest.run.run() end)
vim.keymap.set("n", "<leader>to", function() ntest.output.open() end)
vim.keymap.set("n", "<leader>tp", function() ntest.output_panel.toggle() end)
vim.keymap.set("n", "<leader>tf", function() ntest.run.run(vim.fn.expand("%")) end)
vim.keymap.set("n", "<leader>td", function() ntest.run.run({ strategy = "dap" }) end)
vim.keymap.set("n", "<leader>tS", function() ntest.run.stop() end)
vim.keymap.set("n", "<leader>ts", function() ntest.summary.toggle() end)
vim.keymap.set("n", "<leader>tw", function() ntest.watch.toggle() end)
