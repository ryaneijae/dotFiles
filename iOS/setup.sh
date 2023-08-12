#!/bin/bash
#
# Author: Ryan Cho
#

# if brew is not installed, install, else update
which -s brew
if [[ $? != 0 ]] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    brew update
fi

# Create .zshrc file
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Creating .zshrc in home directory."
    cp .zshrc $HOME/.zshrc
    source $HOME/.zshrc
else
    echo "SETUP FAILED!!!! .zshrc file already exists!"
    exit 1
fi

