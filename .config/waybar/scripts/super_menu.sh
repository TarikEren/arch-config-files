#!/usr/bin/bash

POWER="󰐥 Power"
HEALTH="󰐕 Health"

options="$POWER\n$HEALTH"
input=$(echo -e $options | walker --dmenu -H)

case "$input" in
$POWER)
    ~/.config/waybar/scripts/power_menu.sh
    ;;
$HEALTH)
    ~/.config/waybar/scripts/health_menu.sh
    ;;
*)
    exit 1
    ;;
esac
