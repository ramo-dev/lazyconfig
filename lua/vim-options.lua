vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"

-- Enable true color support (must be set before plugins load)
vim.opt.termguicolors = true

-- Configure diagnostics to show error messages
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
    format = function(diagnostic)
      local message = diagnostic.message
      -- Wrap long messages at 80 characters
      if #message > 80 then
        return message:sub(1, 77) .. "..."
      end
      return message
    end,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN] = "▲",
      [vim.diagnostic.severity.INFO] = "⚑",
      [vim.diagnostic.severity.HINT] = "⚡",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    wrap = true,
    max_width = 80,
  },
})
