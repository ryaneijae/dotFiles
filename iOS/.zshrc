# Path to you zsh configuation
export ZSH=$HOME/.zshrc

# Set Colors
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Setting Up Aliases
alias ll='ls -lG'
alias la='ls -alG'
alias ls='ls -G'

alias vim='nvim'
alias pytest='python3 -m pytest'

# Setting prompt
PROMPT='%F{cyan}[%D{%d%b%Y %H:%M:%S}] %F{magenta}%n@%m:%F{green}%~%F{white} $ '
