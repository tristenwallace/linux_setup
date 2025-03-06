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

3.Install Starship prompt:

```bash
curl -fsSL https://starship.rs/install.sh | sh
```

## Configuring Oh My Zsh

1.Move the zshrc file to the home directory:

```bash
mv configs/.zshrc ~
```

2.Move the starship.toml file to the home directory:

```bash
mv configs/starship.toml ~/.config/starship.toml
```

3.Move the aliases.zsh file to the oh-my-zsh custom directory:

```bash
mv configs/.oh-my-zsh/custom/aliases.zsh ~/.oh-my-zsh/custom/aliases.zsh
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