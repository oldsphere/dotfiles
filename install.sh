#!/bin/bash
# Date: 23/07/2019 20:10:04 
# Author: Carlos R. <oldsphere@gmail.com>
# Description:
#   Install the essentials 

# Install ZSH
if [[ -z `which zsh` ]]; then
    apt-get install zsh
    ZSH_INSTALLED=1 
else
    echo "zsh already installed"
fi

# Install  Oh-My-Zsh
if [[ -z `which zsh` ]]; then
    OhMyZsh_url="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
    sh -c "$(curl -fsSL $OhMyZsh_url)"
    OHMYZSH_INSTALLED=1
fi

# Copy the zsh settings file
cp .zshrc ~

# Install autojump

