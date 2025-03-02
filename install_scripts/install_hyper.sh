#!/bin/bash

installHyper() {
if ! [ -f /opt/hyper.appimage ]; then
echo "Installing Hyper Terminal..."

    # URLs for Hyper AppImage and Icon
    HYPER_URL="https://releases.hyper.is/download/AppImage"
    
    # Paths for installation
    APPIMAGE_PATH="/opt/hyper.appimage"
    ICON_PATH="$(dirname "$(dirname "$0")")/assets/hyper.png"
    DESKTOP_ENTRY_PATH="/usr/share/applications/hyper.desktop"

    # Install curl if not installed
    if ! command -v curl &> /dev/null; then
        echo "curl is not installed. Installing..."
        if ! sudo apt-get update && sudo apt-get install -y curl; then
            echo "Failed to install curl. Please install it manually and try again."
            exit 1
        fi
    fi

    # Download Hyper AppImage
    echo "Downloading Hyper AppImage..."
    if ! sudo curl -L "$HYPER_URL" -o "$APPIMAGE_PATH"; then
        echo "Failed to download Hyper AppImage. Please check your internet connection and try again."
        exit 1
    fi
    
    if ! sudo chmod +x "$APPIMAGE_PATH"; then
        echo "Failed to make AppImage executable."
        exit 1
    fi

    # Create a .desktop entry for Hyper
    echo "Creating .desktop entry for Hyper..."
    if ! sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Hyper Terminal
Exec=$APPIMAGE_PATH --no-sandbox
Icon=$ICON_PATH
Type=Application
Categories=Development;
EOL
    then
        echo "Failed to create desktop entry. You may need to create it manually."
    fi

    # Add Hyper to PATH if not already there
    if [ "$PATH" != *"/opt"* ]; then
        if [ -f "$HOME/.bashrc" ]; then
            echo 'export PATH="/opt:$PATH"' >> "$HOME/.bashrc"
        fi
        if [ -f "$HOME/.zshrc" ]; then
            echo 'export PATH="/opt:$PATH"' >> "$HOME/.zshrc"
        fi
        echo "Added /opt to PATH. Please restart your terminal or source your shell's rc file to apply changes."
    fi

    # Add hyper alias to .bashrc
    echo "Adding hyper alias to .bashrc..."
    if [ -f "$HOME/.bashrc" ]; then
        bash -c "cat >> $HOME/.bashrc" <<EOL

# Hyper alias
function hyper() {
    $APPIMAGE_PATH --no-sandbox "\${@}" > /dev/null 2>&1 & disown
}
EOL
    fi

    # Use . instead of source
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc" || echo "Note: Please restart your terminal or run 'source ~/.bashrc' to use the hyper command"
    fi

    echo "Hyper Terminal installation complete. You can find it in your application menu."
else
    echo "Hyper Terminal is already installed."
fi
}

installHyper