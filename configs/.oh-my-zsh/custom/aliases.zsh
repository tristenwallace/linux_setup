### SYSTEM

# List directory contents in a more readable format with human-readable sizes
alias ll='ls -alh'  # Long list format, show hidden files, and human-readable file sizes

# List only directories
alias lsd='ls -d */'

# Quickly navigate to commonly used directories
alias ..='cd ..'    # Go up one directory
alias ...='cd ../..'  # Go up two directories
alias ....='cd ../../..'  # Go up three directories

# Reload the shell (e.g., after changing .zshrc)
alias reload='source ~/.zshrc'

# Show disk usage in human-readable form
alias dfh='df -h'

# Show free memory and swap in human-readable form
alias freeh='free -h'


### GIT

# Shortcuts for common Git operations
alias gst='git status'  # Display the current status of the git repo
alias gco='git checkout'  # Checkout to a branch or a commit
alias gaa='git add .'  # Add all changes in the current directory to staging
alias gc='git commit -v'  # Commit with verbose output
alias gcm='git commit -m'  # Commit with a message directly
alias gp='git push'  # Push committed changes to the remote repository
alias gpl='git pull'  # Pull the latest changes from the remote repository
alias gcb='git checkout -b'  # Create a new branch and switch to it
alias gcl='git clone'  # Clone a repository from a remote location
alias glg='git log --oneline --graph --all --decorate'  # Visual git log

# Alias for quickly undoing the last commit (without deleting changes)
alias gundo='git reset --soft HEAD~1'


### FILE & DIRECTORY

# Create a new directory and switch into it
alias mkcd='foo(){ mkdir -p "$1" && cd "$1"; }; foo'

# Show file size of a specific file in human-readable format
alias fs='du -sh'

# Extract archives quickly
alias extract='foo(){ tar -xf "$1"; }; foo'  # Extract tar files

# Recursive file count in a directory
alias count='find . -type f | wc -l'

# Copy and move files with verbose output
alias cpv='rsync -ah --info=progress2'  # Use rsync for copying files with progress
alias mvv='rsync -ah --remove-source-files --info=progress2'  # Move files with progress


### NETWORKING & REMOTE

# Get your public IP address
alias myip='curl ipinfo.io/ip'

# Shortcut for SSH connection
alias sshc='ssh user@hostname'

# Scan local network for active devices
alias scan='nmap -sn 192.168.1.0/24'

# Show current network configuration
alias mynet='ifconfig | grep inet'

# Check open ports on a remote server
alias ports='sudo netstat -tuln'


### PACKAGE MGMT

# Shortcuts for apt package management (Debian/Ubuntu systems)
alias update='sudo apt update && sudo apt upgrade -y'  # Update and upgrade system packages
alias install='sudo apt install'  # Install a package
alias remove='sudo apt remove'  # Remove a package
alias search='apt search'  # Search for a package
alias cleanup='sudo apt autoremove && sudo apt autoclean'  # Clean up unused packages

# Shortcuts for npm package management (Node.js)
alias ni='npm install'  # Install dependencies from package.json
alias ns='npm start'  # Start the project
alias nt='npm test'  # Run tests
alias nb='npm run build'  # Build the project


### DOCKER

# Shortcuts for common Docker commands
alias dps='docker ps'  # List running containers
alias di='docker images'  # List all docker images
alias dbuild='docker build .'  # Build a Docker image in the current directory
alias drm='docker rm $(docker ps -a -q)'  # Remove all stopped containers
alias drmi='docker rmi $(docker images -q)'  # Remove all Docker images
alias dexec='docker exec -it'  # Enter a running container interactively
alias dstop='docker stop $(docker ps -q)'  # Stop all running containers
alias dclean='docker system prune -af'  # Clean up all unused containers, networks, and images


### PYTHON

# Create and activate Python virtual environments
alias mkvenv='python3 -m venv venv'  # Create a new virtual environment in a folder called "venv"
alias venv='source venv/bin/activate'  # Activate a virtual environment

# Quick access to Python package manager
alias pipup='pip install --upgrade pip'  # Upgrade pip
alias pipreq='pip freeze > requirements.txt'  # Generate requirements file
alias pipinstall='pip install -r requirements.txt'  # Install dependencies from a requirements file

# Check for PEP8 compliance
alias pep8check='flake8 .'  # Run flake8 linter to check for PEP8 compliance in current directory

# Pytest Testing
alias test='pytest -vv'
alias testlog='pytest -vv --log-cli-level=INFO'


### MISCELLANEOUS

# Create a timestamped backup of a file
alias backup='foo(){ cp "$1" "$1.bak_$(date +%F_%T)"; }; foo'

# Clear terminal screen but keep scrollback buffer
alias cls='printf "\033c"'

# Quick access to frequently used files
alias zsh='cursor ~/.zshrc'  # Edit Zsh configuration file
alias bash='cursor ~/.bashrc'  # Edit Bash configuration file
alias starship='cursor ~/.config/starship.toml'
alias hosts='sudo cursor /etc/hosts'  # Edit system hosts file
alias hotzsh='cursor ~/.oh-my-zsh/custom/aliases.zsh' # Edit Zsh aliases

# Weather information for a specific city (replace CITY with your location)
alias weather='curl wttr.in/clifton'

# Open current directory in file manager
alias open='xdg-open .'  # Linux file manager

# Use bat instead of cat
alias cat='bat'
