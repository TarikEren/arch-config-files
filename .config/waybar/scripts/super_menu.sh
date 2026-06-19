#!/usr/bin/bash
source $HOME/.config/waybar/scripts/utils.sh
source $HOME/.config/waybar/scripts/definitions.sh

POWER="󰐥 Power"
HEALTH="󰐕 Health"
WIFI="Wifi"
BLUETOOTH="Bluetooth"

options="$POWER\n$HEALTH\n$WIFI\n$BLUETOOTH"
input=$(echo -e $options | walker --dmenu -H)

case "$input" in
$POWER)
    $MENU_DIR/power_menu.sh
    ;;
$HEALTH)
    $MENU_DIR/health_menu.sh
    ;;
$WIFI)
    kitty sudo impala
    ;;
$BLUETOOTH)
    kitty bluetui
    ;;
*)
    exit 1
    ;;
esac
