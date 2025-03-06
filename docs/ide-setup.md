# IDE Setup Guide

This guide will help you set up Visual Studio Code (VSCode) and Cursor IDE on your Linux machine, along with syncing your VSCode extensions and settings.

## Installing Visual Studio Code

1.Add the Microsoft GPG key:

```bash
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
```

2.Add the VS Code repository:

```bash
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
```

3.Install VS Code:

```bash
sudo apt update
sudo apt install code
```

4.Install VS Code extensions:

- Log into your GitHub account in VS Code
- Turn on Sync

## Installing Cursor IDE

1.Run the installation script:

```bash
# Make the script executable
chmod +x install_scripts/install_cursor.sh

# Run the installation script
./install_scripts/install_cursor.sh
```

The script will:

- Download the Cursor AppImage
- Install it in `/opt/cursor.appimage`
- Create a desktop entry
- Create a convenient `cursor` alias

2.Verify the installation:

```bash
cursor --version
```

Note: The installation script handles all the necessary setup, including:

- Downloading and setting up the AppImage
- Creating desktop shortcuts
- Setting up system integration
- Adding convenient aliases to your shell configuration

3.Install Cursor extensions:

- Click to import extensions from local VS Code

For more information:

- [VS Code Documentation](https://code.visualstudio.com/docs)
- [Cursor Documentation](https://cursor.sh/docs)

## Fonts

1. Install Fira Code (if not already installed from the [terminal setup](terminal-setup.md#installing-fira-code))

2. Configure Cursor IDE to use Fira Code:
   - Open Cursor Settings (Ctrl+,)
   - Search for "font"
   - In "Font Family", add `'Fira Code'` at the beginning of the list
   - Enable "Font Ligatures" for programming ligature support

3. Verify the font is working:
   - Open a code file
   - You should see ligatures in operators like `=>`, `!=`, and `>=`
   - The text should appear crisp and clear using Fira Code


