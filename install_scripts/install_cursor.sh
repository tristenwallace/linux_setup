#!/bin/bash

installCursor() {
if ! [ -f /opt/cursor.appimage ]; then
echo "Installing Cursor AI IDE..."

    # URLs for Cursor AppImage and Icon
    CURSOR_URL="https://downloader.cursor.sh/linux/appImage/x64"
    
    # Paths for installation
    APPIMAGE_PATH="/opt/cursor.appimage"
    SYSTEM_ICON_PATH="/opt/cursor.png"
    SCRIPT_DIR="$(dirname "$(realpath "$0")")"
    ICON_SOURCE_PATH="$SCRIPT_DIR/../assets/cursor.png"
    DESKTOP_ENTRY_PATH="/usr/share/applications/cursor.desktop"

    # Install curl if not installed
    if ! command -v curl &> /dev/null; then
        echo "curl is not installed. Installing..."
        if ! sudo apt-get update && sudo apt-get install -y curl; then
            echo "Failed to install curl. Please install it manually and try again."
            exit 1
        fi
    fi

    # Download Cursor AppImage
    echo "Downloading Cursor AppImage..."
    if ! sudo curl -L "$CURSOR_URL" -o "$APPIMAGE_PATH"; then
        echo "Failed to download Cursor AppImage. Please check your internet connection and try again."
        exit 1
    fi
    
    if ! sudo chmod +x "$APPIMAGE_PATH"; then
        echo "Failed to make AppImage executable."
        exit 1
    fi

    # Copy icon to system location and update icon cache
    echo "Installing Cursor icon..."
    if [ -f "$ICON_SOURCE_PATH" ]; then
        if ! sudo cp "$ICON_SOURCE_PATH" "$SYSTEM_ICON_PATH"; then
            echo "Failed to copy icon file. Desktop icon might not display correctly."
        else
            # Update icon cache
            if command -v gtk-update-icon-cache &> /dev/null; then
                sudo gtk-update-icon-cache -f -t /opt/cursor.png
            fi
        fi
    else
        # If local icon not found, try downloading directly from Cursor
        echo "Warning: Local icon file not found. Attempting to download..."
        if ! sudo curl -L "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5XyLY01daZHJdYazoX0wflUTNwbXSqb18YBy6ekIlJQnearwlAPvvuorJv_KO9GZUZhI&usqp=CAU" -o "$SYSTEM_ICON_PATH"; then
            echo "Failed to download icon. Desktop icon might not display correctly."
        fi
    fi

    # Create a .desktop entry with absolute paths
    echo "Creating .desktop entry for Cursor..."
    if ! sudo bash -c "cat > $DESKTOP_ENTRY_PATH" <<EOL
[Desktop Entry]
Name=Cursor AI IDE
Exec=$APPIMAGE_PATH --no-sandbox %F
Icon=$SYSTEM_ICON_PATH
Type=Application
Categories=Development;TextEditor;IDE;
MimeType=text/plain;inode/directory;
Comment=AI-first code editor
StartupWMClass=cursor
EOL
    then
        echo "Failed to create desktop entry. You may need to create it manually."
    fi

    # Add cursor alias to .zshrc
    echo "Adding cursor alias to .zshrc..."
    if [ -f "$HOME/.zshrc" ]; then
        cat >> "$HOME/.zshrc" <<EOL

# Cursor alias
function cursor() {
    $APPIMAGE_PATH --no-sandbox "\${@}" > /dev/null 2>&1 & disown
}
EOL
        echo "Added cursor alias to .zshrc. Please restart your terminal or run 'source ~/.zshrc' to use the cursor command"
    fi

    echo "Cursor AI IDE installation complete. You can find it in your application menu."
else
    echo "Cursor AI IDE is already installed."
fi
}

installCursor
