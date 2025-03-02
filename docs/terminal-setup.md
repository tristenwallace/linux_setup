# Terminal Setup Guide

This guide will help you set up a modern terminal environment with Zsh, Oh My Zsh, and Hyper terminal.

## Installing Zsh

1.Update your package list:

```bash
sudo apt update
```

2.Install Zsh:

```bash
sudo apt install zsh
```

3.Verify the installation:

```bash
zsh --version
```

4.Make Zsh your default shell:

```bash
chsh -s $(which zsh)
```

Note: You'll need to log out and back in for this change to take effect.

## Installing Oh My Zsh

1.Install required packages:

```bash
sudo apt install curl git
```

2.Install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Configuring Oh My Zsh

1.Install recommended plugins:

```bash
# Install Syntax Highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

2.Edit your `~/.zshrc` file to enable plugins:

```bash
# Open .zshrc in your preferred editor
nano ~/.zshrc

# Add or modify the plugins line to include:
plugins=(
    git
    docker
    docker-compose
    npm
    node
    vscode
    zsh-syntax-highlighting
    zsh-autosuggestions
)
```

## Installing Hyper Terminal

1.Run the installation script:

```bash
# Make the script executable
chmod +x install_scripts/install_hyper.sh

# Run the installation script
./install_scripts/install_hyper.sh
```

The script will:

- Download the Hyper AppImage
- Install it in `/opt/hyper.appimage`
- Create a desktop entry
- Add Hyper to your PATH
- Create a convenient `hyper` alias

2.Verify the installation:

```bash
hyper --version
```

Note: The installation script handles all the necessary setup, including:

- Downloading and setting up the AppImage
- Creating desktop shortcuts
- Setting up system integration
- Adding convenient aliases to your shell configuration

## Configuring Hyper

1.Copy the provided configuration file:

```bash
# Create the Hyper config directory if it doesn't exist
mkdir -p ~/.config/Hyper

# Copy the configuration file
cp configs/hyper.example.js ~/.hyper.js
```

The configuration includes:

- Font configuration (Fira Code with fallbacks)
- Custom cursor shape (UNDERLINE)
- Comfortable padding
- Automatic clipboard copy on selection
- Pokemon theme (Charmander)
- Useful status line plugins

2.Install the required plugins:

```bash
# Install all plugins defined in the configuration
hyper i hyper-pokemon
hyper i hypercwd
hyper i hyper-search
hyper i hyperline
hyper i hyper-statusline
```

3.Install Fira Code font (recommended):

```bash
# Make the script executable
chmod +x install_scripts/install_firacode.sh

# Run the installation script
./install_scripts/install_firacode.sh
```

The script will:

- Create necessary font directories
- Install Fira Code fonts from the provided files
- Update the font cache
- Verify the installation

You can verify the fonts are installed manually:

```bash
fc-list | grep "Fira Code"
```

Note: Fira Code provides beautiful programming ligatures that make code more readable by combining common programming symbols into single logical tokens.

font by [Nikita Prokopov](https://github.com/tonsky/FiraCode?tab=readme-ov-file)

## Additional Customization

1.Install and configure Powerlevel10k theme (optional):

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Edit ~/.zshrc and set:
ZSH_THEME="powerlevel10k/powerlevel10k"
```

2.Configure Powerlevel10k:

```bash
# Restart your terminal and follow the configuration wizard
p10k configure
```
