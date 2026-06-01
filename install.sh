#!/usr/bin/bash

# Installation script that backs up any existing configs before synchronizing its own dotfiles.

set -euo pipefail

CONFIG_DIRS=("btop" "hypr" "kitty" "nvim" "swaync" "walker" "waybar")
CONFIG_ROOT="$HOME/.config"
BACKUP_DIR="$CONFIG_ROOT/backup"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if stow is installed
if ! command -v stow &>/dev/null; then
    printf "[WARN] stow is not installed. Installing...\n"
    sudo pacman -S stow
fi

printf "[INFO] Started installation\n"
printf "[INFO] Checking existing configurations in $BACKUP_DIR\n"

# Check if there are any pre-existing configs
for dir in "${CONFIG_DIRS[@]}"; do
    curr_path="$CONFIG_ROOT/$dir"

    if [ -e "$curr_path" ] || [ -L "$curr_path" ]; then
        local_target="$SCRIPT_DIR/.config/$dir"

        if [ -L "$curr_path" ] && [[ "$(readlink -f "$curr_path")" == "$(realpath "$local_target")" ]]; then
            # If the configs are linked from this directory, skip
            printf "[INFO] Config for '$dir' is already correctly stowed. Skipping...\n"
        else
            # Else, back them up
            printf "[WARN] Config $curr_path exists. Creating backup...\n"
            mkdir -p "$BACKUP_DIR"
            mv "$curr_path" "$BACKUP_DIR/"
        fi
    fi
done

# Stow the configs
stow .
printf "[INFO] Stowed configs"

# Reload hyprctl if hyprland is running
if printenv HYPRLAND_INSTANCE_SIGNATURE &>/dev/null; then
    printf "[INFO] Reloading hyprctl... \n"
    hyprctl reload &>/dev/null
fi

printf "[INFO] Installation done.\n"
