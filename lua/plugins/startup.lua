return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        local ascii = {
            "",
            " ██████╗ ██████╗  ██████╗  ██████╗ ██╗   ██╗██╗   ██╗",
            "██╔════╝ ██╔══██╗██╔═══██╗██╔═══██╗██║   ██║╚██╗ ██╔╝",
            "██║  ███╗██████╔╝██║   ██║██║   ██║██║   ██║ ╚████╔╝ ",
            "██║   ██║██╔══██╗██║   ██║██║   ██║╚██╗ ██╔╝  ╚██╔╝  ",
            "╚██████╔╝██║  ██║╚██████╔╝╚██████╔╝ ╚████╔╝    ██║   ",
            " ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═══╝     ╚═╝   ",
            "",
            "     a lightning-fast, AI-powered neovim config",
            "",
        }

        dashboard.section.header.val = ascii

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file", "<cmd>ene<CR>"),
            dashboard.button("SPC f f", "󰈞  Find file"),
            dashboard.button("SPC f r", "󰊄  Recent files"),
            dashboard.button("SPC /", "󰟔  Live grep"),
        }

        dashboard.section.footer.val = {
            "",
            "  press any key to continue",
        }

        alpha.setup(dashboard.opts)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
                vim.keymap.set("n", "q", "<cmd>Alpha<cr>", { buffer = true })
            end,
        })
    end,
}
