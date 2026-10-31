# Steps to set up a new Mac

## Run the setup script
From anywhere:

```
~/projects/dotFiles/iOS/setup.sh
```

It is safe to re-run. It skips any config file that already exists rather than overwriting it.

## What it does
- Installs Homebrew if missing and adds `brew shellenv` to `~/.zprofile` (Apple Silicon path `/opt/homebrew`)
- Installs `neovim`, `node` (needed by coc.nvim), and the `font-jetbrains-mono-nerd-font` and `rectangle` casks
- Copies `iOS/.zshrc` to `~/.zshrc`
- Copies `iOS/nvim` to `~/.config/nvim`
- Installs vim-plug and runs `:PlugInstall` headlessly

## Manual steps afterward
1. Open a new terminal window so `.zshrc` loads.
2. Terminal > Settings > Profiles > Text: set the font to "JetBrainsMono Nerd Font".

## Not handled by the script
- `iOS/.vimrc` is not deployed. `vim` is aliased to `nvim`, which reads `~/.config/nvim/init.vim`, not `.vimrc`.
