#!/bin/bash

installHyper() {
if ! [ -f /opt/hyper.appimage ]; then
echo "Installing Hyper Terminal..."

    # URLs for Hyper AppImage and Icon
    HYPER_URL="https://releases.hyper.is/download/AppImage"
    
    # Paths for installation
    APPIMAGE_PATH="/opt/hyper.appimage"
    SYSTEM_ICON_PATH="/opt/hyper.png"
    ICON_SOURCE_PATH="$(dirname "$(dirname "$0")")/assets/hyper.png"
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

    # Copy icon to system location and update icon cache
    echo "Installing Hyper icon..."
    if [ -f "$ICON_SOURCE_PATH" ]; then
        if ! sudo cp "$ICON_SOURCE_PATH" "$SYSTEM_ICON_PATH"; then
            echo "Failed to copy icon file. Desktop icon might not display correctly."
        else
            # Update icon cache
            if command -v gtk-update-icon-cache &> /dev/null; then
                sudo gtk-update-icon-cache -f -t /usr/share/icons/hicolor
            fi
        fi
    else
        # If local icon not found, try downloading directly from Hyper
        echo "Warning: Local icon file not found. Attempting to download..."
        if ! sudo curl -L "https://raw.githubusercontent.com/vercel/hyper/canary/assets/icon.png" -o "$SYSTEM_ICON_PATH"; then
            echo "Failed to download icon. Desktop icon might not display correctly."
        fi
    fi

    # Create a .desktop entry for Hyper with improved metadata
    echo "Creating .desktop entry for Hyper..."
    if ! sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Hyper Terminal
Exec=$APPIMAGE_PATH --no-sandbox %F
Icon=$SYSTEM_ICON_PATH
Type=Application
Categories=Development;System;TerminalEmulator;
MimeType=text/plain;inode/directory;
Comment=A terminal built on web technologies
StartupWMClass=hyper
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