# Dotfiles

## Overview

**Welcome to my personal collection of DOT Files**

These dotfiles contain my personal configuration for various tools and systems, including:

- Ghostty (Terminal emulator)
- Neovim (Text editor)
- Zsh (Shell)
- TMUX (Terminal Multiplexer)

## Prerequisites

### System Requirements

- macOS (tested on latest version)
- Homebrew package manager

## Setup Instructions

### 1. Install Homebrew

If you haven't already installed Homebrew, run:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Required Tools

```bash
# Terminal Emulator
brew install --cask ghostty

# Neovim
brew install neovim

# Zsh and Oh My Zsh (optional but recommended)
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 3. Clone Dotfiles Repository

```bash
git clone https://github.com/CRasico/dotfiles.git ~/.dotfiles
```

### 4. Symlink Configuration Files

```bash
# Initialize Folders
mkdir -p ~/.config

# Zsh Configuration
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

# Neovim Configuration
ln -s ~/.dotfiles/nvim ~/.config

# Ghostty Configuration
ln -s ~/.dotfiles/ghostty ~/.config


#TMUX Configuration
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
```

#### TMUX Assistance

Just as a friendly reminder you'll need to run the TMUX installation command to ensure TMUX is working appropriately.

## Customization

Feel free to fork this repository and customize the configurations to suit your personal workflow.
