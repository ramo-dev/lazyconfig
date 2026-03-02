return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	config = function()
		require("neo-tree").setup({
			default_component_configs = {
				icon = {
					folder_empty = "󰜌",
				},
				git_status = {
					symbols = {
						added = "",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						untracked = "�.Ignore",
						ignored = "󰀺",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "left",
				width = 35,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
			},
			filesystem = {
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = false,
					hide_by_name = {
						"node_modules",
						".git",
						"dist",
						"build",
						"__pycache__",
					},
				},
				bind_to_cwd = false,
			},
		})

		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
		vim.keymap.set("n", "<leader>H", ":Neotree toggle show_hidden<CR>", { desc = "Toggle hidden files" })
	end,
}
