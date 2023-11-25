return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "mxsdev/nvim-dap-vscode-js"
    },
    config = function()
        local dap = require("dap")
        local dui = require("dapui")
        dui.setup()

        vim.keymap.set("n", "<leader>dui", function() dui.toggle() end)
        vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end)
        vim.keymap.set("n", "<leader>dn", function() dap.continue() end)
        vim.keymap.set("n", "<leader>do", function() dap.step_over() end)
        vim.keymap.set("n", "<leader>dO", function() dap.step_out() end)
        vim.keymap.set("n", "<leader>di", function() dap.step_into() end)
        vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end)

        require("dap-vscode-js").setup({
            node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
            -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
            adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
            -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })

        dap.listeners.after.event_initialized["dapui_config"] = function()
            dui.open()
        end

        dap.adapters.gdb = {
            type = "executable",
            command = "gdb",
            args = { "-i", "dap" }
        }

        dap.configurations.c = {
            {
                name = "Launch",
                type = "gdb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = "${workspaceFolder}",
            },
        }

        for _, language in ipairs({ "typescript", "javascript" }) do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach Node",
                    -- processId = require('dap.utils').pick_process,
                    cwd = "${workspaceFolder}",
                    port = 9229,
                    skipFiles = { "<node_internals>/**" }
                },
                {
                    type = "pwa-chrome",
                    request = "attach",
                    name = "Attach Chrome",
                    processId = require('dap.utils').pick_process,
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                -- {
                --   type = "pwa-node",
                --   request = "launch",
                --   name = "Debug Mocha Tests",
                --   -- trace = true, -- include debugger info
                --   runtimeExecutable = "node",
                --   runtimeArgs = {
                --     "./node_modules/mocha/bin/mocha.js",
                --   },
                --   rootPath = "${workspaceFolder}",
                --   cwd = "${workspaceFolder}",
                --   console = "integratedTerminal",
                --   internalConsoleOptions = "neverOpen",
                -- }
            }
        end

        -- I've never used this, but seems like it will be helpful at some point
        vim.api.nvim_create_user_command("RunScriptWithArgs", function(t)
            -- :help nvim_create_user_command
            args = vim.split(vim.fn.expand(t.args), '\n')
            approval = vim.fn.confirm(
                "Will try to run:\n    " ..
                vim.bo.filetype .. " " ..
                vim.fn.expand('%') .. " " ..
                t.args .. "\n\n" ..
                "Do you approve? ",
                "&Yes\n&No", 1
            )
            if approval == 1 then
                dap.run({
                    type = vim.bo.filetype,
                    request = 'launch',
                    name = 'Launch file with custom arguments (adhoc)',
                    program = '${file}',
                    args = args,
                })
            end
        end, {
            complete = 'file',
            nargs = '*'
        })

        vim.keymap.set('n', '<leader>R', ":RunScriptWithArgs ")
    end
}
