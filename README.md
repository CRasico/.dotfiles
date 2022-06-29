# .dotfiles

This is my personal collection of dotfiles. They are managed directly via a [installation script](./install.sh) and will automatically symlink to the root `~` directory.

It will also go out and fetch the below resources and install them on your system if they aren't already installed on your system.

## How To Utilize

In orer to install, ensure to download or clone this repository directly to the root directory `~`

From there utilizing bash run the installation script in order to setup your configuration 

## Managed Configurations

Below are the various set of applications that will be managed and installed via the `.dotfiles/install.sh` script:

- Brew: 
    - Installs Brew Directly via the raw installation script
- Git:
    - Utilizes Brew installed above in order to install github
- ZSH:
    - Installs and configures ZSH 
    - Links the root dotfiles ZSH profile configuration with the root user
- TMUX:
    - Installs and configures TMUX
- NEOVIM
    - Installs and configures NEOVIM
    - Will automatically create a `~/.config` folder if one is not already configured
    - Creates and links the neovim `init.vim` 
    - Installs all vim plugins currently installed in the vim initialization script
