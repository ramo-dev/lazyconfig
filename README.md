# GROOVY.nvim

> A lightning-fast, AI-powered Neovim config that breathes.

```
 ██████╗ ██████╗  ██████╗  ██████╗ ██╗   ██╗██╗   ██╗
██╔════╝ ██╔══██╗██╔═══██╗██╔═══██╗██║   ██║╚██╗ ██╔╝
██║  ███╗██████╔╝██║   ██║██║   ██║██║   ██║ ╚████╔╝ 
██║   ██║██╔══██╗██║   ██║██║   ██║╚██╗ ██╔╝  ╚██╔╝  
╚██████╔╝██║  ██║╚██████╔╝╚██████╔╝ ╚████╔╝    ██║   
 ╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝   ╚═══╝     ╚═╝   
                                                     
```

## Features

- **AI Copilot** — Ghost-text suggestions that actually read your mind
- **Fuzzy Finding** — Telescope with FZF-native. Ctrl+p to find, leader/ to grep
- **Transparent UI** — Float like a butterfly, sting like a bee
- **Harpoon** — Jump between files faster than you can say "where was that?"
- **WakaTime** — Track every keystroke. Feel the guilt.
- **Todo Comments** — Highlighted FIXME/TODO/NOTE because we all procrastinate
- **Git Integration** — Gitsigns for inline blame, neo-tree for repo browsing
- **Treesitter** — Syntax highlighting that actually makes sense

## Keybindings

| Binding | Action |
|---------|--------|
| `<C-p>` | Find files (Telescope) |
| `<leader>/` | Live grep |
| `<C-e>` | Harpoon menu |
| `<C-h>` | Add file to Harpoon |
| `<C-t>` | Jump to Harpoon #1 |
| `<A-d>` | Search directories & cd |

## Requirements

- Neovim 0.10+
- Node.js 22+ (for Copilot)
- ripgrep (`rg`)
- fd (optional, for directory search)

## Setup

```bash
# Install plugins
:Lazy sync

# Authenticate Copilot
:Copilot setup
```

## Structure

```
lua/
├── plugins/          # All the goodies
│   ├── telescope.lua # Fuzzy finder
│   ├── copilot.lua   # AI suggestions
│   ├── transparent.lua
│   └── ...
├── vim-options.lua   # Core settings
└── init.lua          # Entry point
```

## Stack

- **Plugin Manager**: lazy.nvim
- **Completion**: nvim-cmp + Copilot
- **LSP**: nvim-lspconfig + mason
- **UI**: snacks.nvim + noice.nvim + alpha-nvim
- **Theme**: Dracula (but transparent)

---

> "I used to think vim was a text editor. Now I know it's a lifestyle."
> — Someone who configures their nvim at 2am
