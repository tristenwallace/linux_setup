eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Add the completion directory to the FPATH
fpath=(~/.zsh/zsh-completions/src $fpath)

# General aliases
alias ll="ls -la"  # List all files in long format
alias gs="git status"  # Short for git status
alias gco="git checkout"  # Short for git checkout

# Navigation aliases
alias ..="cd .."  # Go up one directory
alias ...="cd ../.."  # Go up two directories

# Open configuration files quickly
alias zshrc="nano ~/.zshrc"  # Edit Zsh configuration
alias starshipconfig="nano ~/.config/starship.toml"  # Edit Starship configuration