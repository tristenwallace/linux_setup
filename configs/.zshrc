eval "$(starship init zsh)"

###
# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###
# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add the completion directory to the FPATH
fpath=(~/.zsh/zsh-completions/src $fpath)

###
# Aliases
alias ll="ls -la"  # List all files in long format
alias gs="git status"  # Short for git status
alias gco="git checkout"  # Short for git checkout

alias ..="cd .."  # Go up one directory
alias ...="cd ../.."  # Go up two directories

alias zsh="nano ~/.zshrc"  # Edit Zsh configuration
alias starship="nano ~/.config/starship.toml"  # Edit Starship configuration

###
# Docker configuration
export DOCKER_HOST="unix:///run/docker.sock"
if ! groups | grep -q docker; then
    newgrp docker
fi