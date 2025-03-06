#!/bin/bash

installFiraCode() {
    if ! fc-list | grep -q "Fira Code"; then
        echo "Installing Fira Code fonts..."

        # Create font directory if it doesn't exist
        FONT_DIR="/usr/share/fonts/fira-code"
        if ! sudo mkdir -p "$FONT_DIR"; then
            echo "Failed to create font directory. Please check your permissions."
            exit 1
        fi

        # Get the script's directory and navigate to fonts
        SCRIPT_DIR="$(dirname "$(dirname "$0")")"
        FIRA_DIR="$SCRIPT_DIR/fonts/Fira_Code"

        # Check if font files exist
        if [ ! -d "$FIRA_DIR/ttf" ]; then
            echo "Error: Fira Code font files not found in $FIRA_DIR/ttf"
            echo "Please ensure the Fira Code font files are present in the correct location."
            exit 1
        fi

        # Copy font files
        echo "Copying Fira Code font files..."
        if ! sudo cp "$FIRA_DIR/ttf/"*.ttf "$FONT_DIR/"; then
            echo "Failed to copy font files. Please check your permissions."
            exit 1
        fi

        # Update font cache
        echo "Updating font cache..."
        if ! sudo fc-cache -f -v > /dev/null; then
            echo "Failed to update font cache. Please try running 'sudo fc-cache -f -v' manually."
            exit 1
        fi

        # Verify installation
        echo "Verifying font installation..."
        if fc-list | grep -q "Fira Code"; then
            echo "Fira Code fonts installed successfully!"
            echo "Available Fira Code fonts:"
            fc-list | grep "Fira Code"
        else
            echo "Font installation verification failed. Please check the installation manually."
            exit 1
        fi
    else
        echo "Fira Code fonts are already installed."
        echo "Available Fira Code fonts:"
        fc-list | grep "Fira Code"
    fi
}

installFiraCode 