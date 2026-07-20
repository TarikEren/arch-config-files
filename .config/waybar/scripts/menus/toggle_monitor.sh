#!/usr/bin/bash

source $HOME/.config/waybar/scripts/utils.sh
source $HOME/.config/waybar/scripts/definitions.sh

CONNECTED=$(hyprctl monitors | grep 'Monitor' | awk '{print $2}')

# TODO: Add global parameters for the config
HYPRLAND_RATIO=1.5

if echo "$CONNECTED" | grep -q "HDMI-A-1"; then
    # External monitor is connected, disable laptop screen
    hyprctl keyword monitor "eDP-1, disable"

    # Ensure external monitor is on
    hyprctl keyword monitor "HDMI-A-1, preferred, auto, $HYPRLAND_RATIO"
else
    # External monitor disconnected, enable laptop screen
    hyprctl reload
fi
