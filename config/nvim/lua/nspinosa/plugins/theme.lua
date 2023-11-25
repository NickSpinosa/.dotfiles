return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    dependencies = {
        "freddiehaddad/feline.nvim",
        "nvim-tree/nvim-web-devicons",
        "lewis6991/gitsigns.nvim"
    },
    config = function()
        local clrs = require("catppuccin.palettes").get_palette()
        local ctp_feline = require('catppuccin.groups.integrations.feline')
        local U = require "catppuccin.utils.colors"
        local mocha = require("catppuccin.palettes").get_palette "mocha"
        local feline = require("feline")

        require('gitsigns').setup()
        require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
        })

        function ColorMyPencils(color)
            color = color or "catppuccin-mocha"
            vim.cmd.colorscheme(color)

            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        end

        -- setup must be called before loading
        ctp_feline.setup({
            assets = {
                left_separator = "",
                right_separator = "",
                mode_icon = "",
                dir = "󰉖",
                file = "󰈙",
                lsp = {
                    server = "󰅡",
                    error = "",
                    warning = "",
                    info = "",
                    hint = "",
                },
                git = {
                    branch = "",
                    added = "",
                    changed = "",
                    removed = "",
                },
            },
            sett = {
                text = U.vary_color({ latte = mocha.base }, clrs.surface0),
                bkg = U.vary_color({ latte = mocha.crust }, clrs.surface0),
                diffs = clrs.mauve,
                extras = clrs.overlay1,
                curr_file = clrs.maroon,
                curr_dir = clrs.flamingo,
                show_modified = true -- show if the file has been modified
            },
            mode_colors = {
                ["n"] = { "NORMAL", clrs.lavender },
                ["no"] = { "N-PENDING", clrs.lavender },
                ["i"] = { "INSERT", clrs.green },
                ["ic"] = { "INSERT", clrs.green },
                ["t"] = { "TERMINAL", clrs.green },
                ["v"] = { "VISUAL", clrs.flamingo },
                ["V"] = { "V-LINE", clrs.flamingo },
                ["�"] = { "V-BLOCK", clrs.flamingo },
                ["R"] = { "REPLACE", clrs.maroon },
                ["Rv"] = { "V-REPLACE", clrs.maroon },
                ["s"] = { "SELECT", clrs.maroon },
                ["S"] = { "S-LINE", clrs.maroon },
                ["�"] = { "S-BLOCK", clrs.maroon },
                ["c"] = { "COMMAND", clrs.peach },
                ["cv"] = { "COMMAND", clrs.peach },
                ["ce"] = { "COMMAND", clrs.peach },
                ["r"] = { "PROMPT", clrs.teal },
                ["rm"] = { "MORE", clrs.teal },
                ["r?"] = { "CONFIRM", clrs.mauve },
                ["!"] = { "SHELL", clrs.green },
            }
        })

        -- adapted from https://github.com/Hitesh-Aggarwal/feline_theme.nvim/blob/2ff798d4d0435d2145593587dc93a70e72a6d279/plugin/feline_one_monokai.lua
        -- todo: make this reference my catpuccin theme
        local line_ok, feline = pcall(require, "feline")
        if not line_ok then
            return
        end

        local one_monokai = {
            fg = "#abb2bf",
            bg = "#1e2024",
            green = "#98c379",
            yellow = "#e5c07b",
            purple = "#c678dd",
            orange = "#d19a66",
            peanut = "#f6d5a4",
            red = "#e06c75",
            aqua = "#61afef",
            darkblue = "#282c34",
            dark_red = "#f75f5f",
        }

        local vi_mode_colors = {
            NORMAL = "green",
            OP = "green",
            INSERT = "yellow",
            VISUAL = "purple",
            LINES = "orange",
            BLOCK = "dark_red",
            REPLACE = "red",
            COMMAND = "aqua",
        }

        local c = {
            vim_mode = {
                provider = {
                    name = "vi_mode",
                    opts = {
                        show_mode_name = true,
                        -- padding = "center", -- Uncomment for extra padding.
                    },
                },
                hl = function()
                    return {
                        fg = require("feline.providers.vi_mode").get_mode_color(),
                        bg = "darkblue",
                        style = "bold",
                        name = "NeovimModeHLColor",
                    }
                end,
                left_sep = "block",
                right_sep = "block",
            },
            gitBranch = {
                provider = "git_branch",
                hl = {
                    fg = "peanut",
                    bg = "darkblue",
                    style = "bold",
                },
                left_sep = "block",
                right_sep = "block",
            },
            gitDiffAdded = {
                provider = "git_diff_added",
                hl = {
                    fg = "green",
                    bg = "darkblue",
                },
                left_sep = "block",
                right_sep = "block",
            },
            gitDiffRemoved = {
                provider = "git_diff_removed",
                hl = {
                    fg = "red",
                    bg = "darkblue",
                },
                left_sep = "block",
                right_sep = "block",
            },
            gitDiffChanged = {
                provider = "git_diff_changed",
                hl = {
                    fg = "fg",
                    bg = "darkblue",
                },
                left_sep = "block",
                right_sep = "right_filled",
            },
            separator = {
                provider = "",
            },
            fileinfo = {
                provider = {
                    name = "file_info",
                    opts = {
                        type = "relative-short",
                    },
                },
                hl = {
                    style = "bold",
                },
                left_sep = " ",
                right_sep = " ",
            },
            diagnostic_errors = {
                provider = "diagnostic_errors",
                hl = {
                    fg = "red",
                },
            },
            diagnostic_warnings = {
                provider = "diagnostic_warnings",
                hl = {
                    fg = "yellow",
                },
            },
            diagnostic_hints = {
                provider = "diagnostic_hints",
                hl = {
                    fg = "aqua",
                },
            },
            diagnostic_info = {
                provider = "diagnostic_info",
            },
            lsp_client_names = {
                provider = "lsp_client_names",
                hl = {
                    fg = "purple",
                    bg = "darkblue",
                    style = "bold",
                },
                left_sep = "left_filled",
                right_sep = "block",
            },
            file_type = {
                provider = {
                    name = "file_type",
                    opts = {
                        filetype_icon = true,
                        case = "titlecase",
                    },
                },
                hl = {
                    fg = "red",
                    bg = "darkblue",
                    style = "bold",
                },
                left_sep = "block",
                right_sep = "block",
            },
            file_encoding = {
                provider = "file_encoding",
                hl = {
                    fg = "orange",
                    bg = "darkblue",
                    style = "italic",
                },
                left_sep = "block",
                right_sep = "block",
            },
            position = {
                provider = "position",
                hl = {
                    fg = "green",
                    bg = "darkblue",
                    style = "bold",
                },
                left_sep = "block",
                right_sep = "block",
            },
            line_percentage = {
                provider = "line_percentage",
                hl = {
                    fg = "aqua",
                    bg = "darkblue",
                    style = "bold",
                },
                left_sep = "block",
                right_sep = "block",
            },
            scroll_bar = {
                provider = "scroll_bar",
                hl = {
                    fg = "yellow",
                    style = "bold",
                },
            },
        }

        local left = {
            c.vim_mode,
            c.gitBranch,
            c.gitDiffAdded,
            c.gitDiffRemoved,
            c.gitDiffChanged,
            c.separator,
        }

        local middle = {
            c.fileinfo,
            c.diagnostic_errors,
            c.diagnostic_warnings,
            c.diagnostic_info,
            c.diagnostic_hints,
        }

        local right = {
            c.lsp_client_names,
            c.file_type,
            c.file_encoding,
            c.position,
            c.line_percentage,
            c.scroll_bar,
        }

        local components = {
            active = {
                left,
                middle,
                right,
            },
            inactive = {
                left,
                middle,
                right,
            },
        }

        feline.setup({
            components = components,
            theme = one_monokai,
            vi_mode_colors = vi_mode_colors,
        })

        vim.cmd.colorscheme "catppuccin"
    end
}
