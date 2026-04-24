# Neovim Config

Neovim 0.11+

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point (leader key, nerd font flag, requires)
├── lsp/                        # Native LSP server configs (vim.lsp.config)
│   ├── clangd.lua              # C/C++
│   ├── lua_ls.lua              # Lua
│   ├── ts_ls.lua               # TypeScript/JavaScript
│   └── ty.lua                  # Python (ty type checker)
└── lua/
    ├── config/
    │   ├── options.lua          # Editor options
    │   ├── keymaps.lua          # Keymaps and autocmds
    │   ├── lsp.lua              # LSP attach keymaps, diagnostics config
    │   └── lazy-bootstrap.lua   # Lazy.nvim bootstrap + plugin loader
    └── plugins/                 # Plugin specs (auto-imported by Lazy)
        ├── blink-cmp.lua        # Completion (blink.cmp + LuaSnip)
        ├── colorscheme.lua      # Kanagawa (transparent)
        ├── conform.lua          # Formatting (ruff, stylua, prettier, clang-format)
        ├── debug.lua            # DAP (nvim-dap + dap-view + dap-python)
        ├── diffview.lua         # Git signs + codediff.nvim
        ├── flash.lua            # Motion (s/S to jump)
        ├── fuzzy-finder/        # Snacks.picker + fff.nvim (Rust fuzzy finder)
        ├── grug-far.lua         # Find and replace
        ├── indent_line.lua      # Indent guides
        ├── lint.lua             # Linting (ruff, mypy, markdownlint)
        ├── lspconfig.lua        # lazydev.nvim (Lua LSP enhancement)
        ├── mini.lua             # mini.ai, mini.surround, mini.statusline, mini.files
        ├── misc.lua             # better-escape, guess-indent, autopairs
        ├── neoscroll.lua        # Smooth scrolling
        ├── smear-cursor.lua     # Cursor animation
        ├── substitute.lua       # Enhanced substitution (x/xx/X)
        ├── todo-comments.lua    # Highlight TODOs
        ├── treesitter.lua       # Treesitter + textobjects
        ├── ufo.lua              # Code folding
        └── which-key.lua        # Keymap hints
```

## Key mappings

### General

| Key | Mode | Action |
|-----|------|--------|
| `j` / `k` | n | Move through wrapped lines |
| `>` / `<` | v | Indent and reselect |
| `<C-h/j/k/l>` | n | Navigate splits |
| `<S-h>` / `<S-l>` | n | Previous / next buffer |
| `<Esc>` | n | Clear search highlights |

### Find (`<leader>f`)

| Key | Action |
|-----|--------|
| `<leader>ff` | Find files (fff) |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fc` | Command history |
| `<leader>fn` | Notifications |
| `<leader>fp` | Projects |
| `<leader>fe` | File explorer (mini.files) |
| `<leader>fr` | Find and replace (grug-far) |
| `<leader>ft` | Todo comments |

### Code (`<leader>c`)

| Key | Action |
|-----|--------|
| `<leader>cr` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>cf` | Format buffer |
| `<leader>cs` / `<leader>cS` | Swap parameter forward / backward |

### Git (`<leader>g`)

| Key | Action |
|-----|--------|
| `]h` / `[h` | Next / prev git hunk |
| `<leader>gs` | Stage hunk |
| `<leader>gr` | Reset hunk |
| `<leader>gp` | Preview hunk |
| `<leader>gb` | Blame line |
| `<leader>gd` | Diff against index |

### Diff (`<leader>v`)

| Key | Action |
|-----|--------|
| `<leader>vd` | Diff status (codediff) |
| `<leader>vm` | Diff vs master |
| `<leader>vf` | Diff file vs HEAD |
| `<leader>vc` | Diff last commit |

### Debug (`<leader>b`)

| Key | Action |
|-----|--------|
| `<leader>bb` | Toggle breakpoint |
| `<leader>bc` | Continue |
| `<leader>bs` | Step over |
| `<leader>bi` | Step into |
| `<leader>bo` | Step out |
| `<leader>bq` | Quit/terminate |
| `<leader>bu` | Toggle debug UI |

### Diagnostics

| Key | Action |
|-----|--------|
| `<leader>e` | Show diagnostic float |
| `<leader>q` | Diagnostic quickfix list |
| `]d` / `[d` | Next / prev diagnostic |

### LSP (`gr` prefix)

| Key | Action |
|-----|--------|
| `grd` | Go to definition |
| `grr` | Go to references |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grn` | Rename |
| `gra` | Code action |
| `grD` | Go to declaration |
| `<leader>th` | Toggle inlay hints |

### Treesitter selection (`<leader>s`)

| Key | Action |
|-----|--------|
| `<leader>si` | Init selection |
| `<leader>sn` | Expand to next node |
| `<leader>ss` | Expand to scope |
| `<leader>sp` | Shrink to previous node |

### Surround (mini.surround)

| Key | Action | Example |
|-----|--------|---------|
| `gsa{motion}{char}` | Add surrounding | `gsaiw)` wraps word in parens |
| `gsd{char}` | Delete surrounding | `gsd'` removes quotes |
| `gsr{old}{new}` | Replace surrounding | `gsr)"` changes parens to double quotes |

### Other

| Key | Mode | Action |
|-----|------|--------|
| `s` / `S` | n, x, o | Flash jump / treesitter |
| `x` / `xx` / `X` | n | Substitute operator / line / to EOL |
| `zR` / `zM` | n | Open / close all folds |
| `zK` | n | Peek fold |

## LSP servers

Configs live in `lsp/` and are auto-discovered. Install the servers yourself:

| Server | Language | Install |
|--------|----------|---------|
| `lua_ls` | Lua | `brew install lua-language-server` |
| `ty` | Python | `uv tool install ty` (installs to `~/.local/bin/ty`) |
| `ts_ls` | JS/TS | `npm i -g typescript-language-server typescript` |
| `clangd` | C/C++ | `sudo apt install clangd` |

## Dependencies

- **Neovim 0.11+** (for native `vim.lsp.config`)
- **Nerd Font** (JetBrainsMono recommended)
- **ripgrep** (`rg`) for grep-based pickers
- **Rust toolchain** for fff.nvim build (optional)
