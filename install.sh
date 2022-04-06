#!/bin/bash
REGULAR="\033[0m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"

STARTING_INSTALLATION="${REGULAR}Beginning .dotfiles Installation${REGULAR}"
INSTALLATION_SUCCESSFUL="${GREEN}Completed Install Successful${REGULAR}"
ATTEMPTING_BREW_INSTALL="${CYAN}Attempting to install brew${REGULAR}"
INSTALL_BREW_SUCCESSFUL="${GREEN}Successfully installed brew"
ATTEMPTING_GIT_INSTALL="${CYAN}Attempting to install git${REGULAR}"
INSTALL_GIT_SUCCESSFUL="${GREEN}Successfully installed git${REGULAR}"
ATTEMPTING_ZSH_INSTALL="${CYAN}Attempting to install zsh${REGULAR}"
INSTALL_ZSH_SUCCESSFUL="${GREEN}Successfully installed zsh${REGULAR}"
ATTEMPTING_NEOVIM_INSTALL="${CYAN}Attempting to install neovim${REGULAR}"
INSTALL_NEOVIM_SUCCESSFUL="${GREEN}Successfully installed neovim${REGULAR}"
LINK_ZSH="${YELLOW}Removing and Adding Symlink for .zshrc${REGULAR}"
LINK_NEOVIM="${YELLOW}Removing and Adding Symlink for nvim in .config/nvim${REGULAR}"

echo -e $STARTING_INSTALLATION

# Psuedo Code:
# 1. Validate/Update Brew Installation 
# 2. Install GIT
# 3. Bind .gitconfig
# 3. Use Brew to install ZSH
# 4. Bind .zshrc
# 5. Use Brew to install NeoVim
# 6. Bind .config/nvim/init.vim

echo -e $ATTEMPTING_BREW_INSTALL
has_brew=`which brew`
if [ has_brew == "brew not found" ]
then
    echo 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo -e $INSTALL_BREW_SUCCESSFUL

echo -e $ATTEMPTING_GIT_INSTALL
has_git=`which git`
if [ has_git == "git not found" ]
then 
    brew install git
fi
echo -e $INSTALL_GIT_SUCCESSFUL

echo -e $ATTEMPTING_ZSH_INSTALL
has_zsh=`which zsh`
if [ has_zsh == "zsh not found" ]
then
    brew install zsh
fi
echo -e $INSTALL_ZSH_SUCCESSFUL

echo -e $LINK_ZSH
unlink ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo -e $ATTEMPTING_NEOVIM_INSTALL
has_nvim=`which nvim`
if [ has_nvim == "nvim not found" ]
then
    brew install neovim
fi
echo -e $INSTALL_NEOVIM_SUCCESSFUL

echo -e $LINK_NEOVIM
mkdir -p ~/.config/nvim
unlink ~/.config/nvim/init.vim
ln -s ~/.dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
nvim --headless +PlugInstall
quit
