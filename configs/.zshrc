eval "$(starship init zsh)"

export ZSH="$HOME/.oh-my-zsh"

# Which plugins would you like to load?
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. 
source $ZSH_CUSTOM/aliases.zsh
# For a full list of active aliases, run `alias`.

###
# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

###
# Docker configuration
export DOCKER_HOST="unix:///run/docker.sock"
if ! groups | grep -q docker; then
    newgrp docker
fi

# Cursor alias
function cursor() {
    /opt/cursor.appimage --no-sandbox "${@}" > /dev/null 2>&1 & disown
}

# Add /usr/bin to PATH
export PATH="/usr/bin:$PATH"

# Add /usr/local/bin to PATH
export PATH="/usr/local/bin:$PATH"

# Add /opt to PATH
export PATH="/opt:$PATH"