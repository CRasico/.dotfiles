# NVIM Configuration Settings

## Modules

### Core

A module that contains all core modules for neovim. This includes base file remaps and other things.

### Plugins

The main module containing all added packages, making neovim an IDE

#### Colorscheme

- Catppuccin: A simple pastal color pallette for neovim that makes text easier to read and easier to edit code.

#### Autocompletion

- nvim-cmp: an auto completion engine that pays easy with neovims builtin settings
- luasnip: an lua snippet engine

#### Mason

- mason: a package manager for all things LSP, debugging and formatting

#### Formatting

- null_ls to support builtins for auto formatting various files
- plenary a precursor to using null_ls
- mason_null_ls to help install and configure handlers for formatters supported by Mason

### Telescope

A file search

### TODO's

- [x] Add Colorscheme - Catppuccin
- [x] Add LSP Management - Mason
- [ ] Debugger - NVIM DAP and NVIM DAP UI
- [x] File Explorer - Nvim Tree
- [x] Telescope
- [x] Which Key (to make it easy to main
- [x] FZF Fuzzy Finder
- [x] Autocompletion Engine
- [x] File Formatter
