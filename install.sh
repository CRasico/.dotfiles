#!/bin/bash

REGULAR="\033[0m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
CYAN="\033[0;36m"

STARTING_INSTALLATION="${REGULAR}Beginning .dotfiles Installation${REGULAR}" INSTALLATION_SUCCESSFUL="${GREEN}Completed Install Successful${REGULAR}"
ATTEMPTING_BREW_INSTALL="${CYAN}Attempting to install brew${REGULAR}"
INSTALL_BREW_SUCCESSFUL="${GREEN}Successfully installed brew"
ATTEMPTING_GIT_INSTALL="${CYAN}Attempting to install git${REGULAR}"
INSTALL_GIT_SUCCESSFUL="${GREEN}Successfully installed git${REGULAR}"
ATTEMPTING_ZSH_INSTALL="${CYAN}Attempting to install zsh${REGULAR}"
INSTALL_ZSH_SUCCESSFUL="${GREEN}Successfully installed zsh${REGULAR}"
ATTEMPTING_TMUX_INSTALL="${CYAN}Attempting to install tmux${REGULAR}"
INSTALL_TMUX_SUCCESSFUL="${GREEN}Successfully installed tmux${REGULAR}"
ATTEMPTING_NEOVIM_INSTALL="${CYAN}Attempting to install neovim${REGULAR}"
INSTALL_NEOVIM_SUCCESSFUL="${GREEN}Successfully installed neovim${REGULAR}"
ATTEMPING_PACKER_INSTALL="${CYAN}Attempting to install packer${REGULAR}"
INSTALL_PACKER_SUCCESSFUL="${GREEN}Successfully installed packer${REGULAR}"
LINK_ZSH="${YELLOW}Removing and Adding Symlink for .zshrc${REGULAR}"
LINK_NEOVIM="${YELLOW}Removing and Adding Symlink for nvim in .config/nvim${REGULAR}"

echo -e $STARTING_INSTALLATION

echo -e $ATTEMPTING_BREW_INSTALL
has_brew=`which brew`
if [ "$has_brew" == "" ]
then
    echo 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo -e $INSTALL_BREW_SUCCESSFUL

echo -e $ATTEMPTING_GIT_INSTALL
has_git=`which git`
if [ "$has_git" == "" ]
then 
    brew install git
fi
echo -e $INSTALL_GIT_SUCCESSFUL

echo -e $ATTEMPTING_ZSH_INSTALL
has_zsh=`which zsh`
if [ "$has_zsh" == "" ]
then
    brew install zsh
fi
echo -e $INSTALL_ZSH_SUCCESSFUL

echo -e $ATTEMPTING_TMUX_INSTALL 
has_tmux=`which tmux`
if [ "$has_tmux" == "" ]
then 
    brew install tmux
fi
echo -e $INSTALL_TMUX_SUCCESSFUL

echo -e $LINK_ZSH
unlink ~/.zshrc
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

echo -e $ATTEMPTING_NEOVIM_INSTALL
has_nvim=`which nvim`
echo "$has_nvim"
if [ "$has_nvim" == "" ]
then
    brew install nvim
fi
echo -e $INSTALL_NEOVIM_SUCCESSFUL

echo -e $ATTEMPING_PACKER_INSTALL
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo -e $INSTALL_PACKER_SUCCESSFUL

echo -e $LINK_NEOVIM
rm -r ~/.config/nvim
mkdir -p ~/.config
ln -s ~/.dotfiles/.config/nvim ~/.config
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf

nvim +PackerSync
