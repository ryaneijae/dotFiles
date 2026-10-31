#!/bin/bash
#
# Author: Ryan Cho
#
# Sets up a new Mac: Homebrew, packages, .zshrc, and Neovim.
# Safe to re-run: existing config files are skipped, not overwritten.

set -e

# Run relative to this script, no matter where it's called from
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Homebrew ---------------------------------------------------------------
# Install if missing, then load it into this script's PATH
if [ ! -x /opt/homebrew/bin/brew ] && ! command -v brew >/dev/null 2>&1; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Make sure login shells can find brew too
if ! grep -qs 'brew shellenv' "$HOME/.zprofile"; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
fi

brew update

# --- Packages ---------------------------------------------------------------
# neovim: vim is aliased to nvim in .zshrc
# node:   required by coc.nvim
# font:   Nerd Font for airline powerline symbols and vim-devicons
# rectangle: window snapping/tiling
brew install neovim node
brew install --cask font-jetbrains-mono-nerd-font rectangle

# --- .zshrc -----------------------------------------------------------------
if [ ! -f "$HOME/.zshrc" ]; then
    echo "Creating .zshrc in home directory."
    cp "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
else
    echo "Skipping .zshrc: $HOME/.zshrc already exists."
fi

# --- Neovim config ----------------------------------------------------------
mkdir -p "$HOME/.config"
if [ ! -e "$HOME/.config/nvim" ]; then
    echo "Copying nvim config to ~/.config/nvim."
    cp -R "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
else
    echo "Skipping nvim config: $HOME/.config/nvim already exists."
fi

# --- vim-plug ---------------------------------------------------------------
PLUG_VIM="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
if [ ! -f "$PLUG_VIM" ]; then
    echo "Installing vim-plug."
    curl -fLo "$PLUG_VIM" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# --- Neovim plugins ---------------------------------------------------------
echo "Installing Neovim plugins."
nvim --headless +PlugInstall +qall || echo "WARNING: PlugInstall reported errors. Open nvim and run :PlugInstall."

echo
echo "Done. Next steps:"
echo "  1. Open a new terminal window so .zshrc loads."
echo "  2. Terminal > Settings > Profiles > Text: set font to 'JetBrainsMono Nerd Font'."
