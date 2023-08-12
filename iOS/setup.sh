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

