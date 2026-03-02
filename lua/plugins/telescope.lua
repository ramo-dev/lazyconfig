return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { 
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            
            telescope.setup({
                defaults = {
                    file_ignore_patterns = {
                        "node_modules", "build", "dist", "yarn.lock"
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--follow",        
                        "--hidden",        
                        "--no-heading",    
                        "--with-filename",
                        "--line-number",
                        "--column",        
                        "--ignore-case",    
                        "--glob=!**/.git/*",
                        "--glob=!**/.idea/*",
                        "--glob=!**/.vscode/*",
                        "--glob=!**/build/*",
                        "--glob=!**/dist/*",
                        "--glob=!**/yarn.lock",
                        "--glob=!**/package-lock.json",
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        find_command = {
                            "rg",
                            "--files",
                            "--ignore-case",
                            "--hidden",
                            "--glob=!**/.git/*",
                            "--glob=!**/.idea/*",
                            "--glob=!**/.vscode/*",
                            "--glob=!**/build/*",
                            "--glob=!**/dist/*",
                            "--glob=!**/yarn.lock",
                            "--glob=!**/package-lock.json",
                        },
                    },
                },
            })
            telescope.load_extension("fzf")
            
            vim.keymap.set("n", "<C-p>", builtin.find_files, {})
            vim.keymap.set("n", "<leader>/", builtin.live_grep, {})

            function search_and_scope_into_directory()
                builtin.find_files({
                    prompt_title = "Search Directories",
                    find_command = {"fd", "-i", "--type", "d", "--hidden", "--follow"},
                    attach_mappings = function(prompt_bufnr, map)
                        local actions = require("telescope.actions")
                        actions.select_default:replace(function()
                            local selection = require("telescope.actions.state").get_selected_entry()
                            local selected_dir = selection.path
                            vim.cmd("cd " .. selected_dir)
                            actions.close(prompt_bufnr)
                        end)
                        return true
                    end,
                })
            end

            vim.keymap.set("n", "<A-d>", search_and_scope_into_directory)
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
}

