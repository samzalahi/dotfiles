#!/bin/bash

# Configuration
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/default_dotfiles_backup"

# Ensure directories exist
mkdir -p "$BACKUP_DIR"

install_dots() {
    echo "--- Starting Installation ---"
    cd "$DOTFILES_DIR" || exit

    for pkg in */; do
        pkg=${pkg%/}
        echo "Processing package: $pkg"
        
        find "$pkg" -type f | while read -r file; do
            rel_path="${file#$pkg/}"
            target_path="$HOME/$rel_path"
            
            # If a real file exists, move it to backup
            if [ -f "$target_path" ] && [ ! -L "$target_path" ]; then
                echo "Backing up: $rel_path"
                mkdir -p "$BACKUP_DIR/$(dirname "$rel_path")"
                mv "$target_path" "$BACKUP_DIR/$rel_path"
            fi
        done
    done

    # Final symlinking
    # stow -v -R -t ~ */
    # echo "--- Installation Complete ---"
}

restore_defaults() {
    echo "--- Reverting to Defaults ---"
    
    # 1. Remove all symlinks managed by stow
    cd "$DOTFILES_DIR" || exit
    stow -v -D -t ~ */

    # 2. Move files back from backup to HOME
    if [ -d "$BACKUP_DIR" ]; then
        cp -as "$BACKUP_DIR/." "$HOME/" # Create symbolic links from backup first to test
        # OR use the move command to fully restore:
        # cp -rn "$BACKUP_DIR/"* "$HOME/" && rm -rf "$BACKUP_DIR"
        echo "Files restored from $BACKUP_DIR"
    else
        echo "Error: Backup directory not found!"
    fi
    echo "--- Restore Complete ---"
}

# Simple Menu
case "$1" in
    move)
        install_dots
        ;;
    restore)
        restore_defaults
        ;;
    *)
        echo "Usage: $0 {install|restore}"
        exit 1
        ;;
esac
