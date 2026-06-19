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
    if [ ! -n "$(find /sys/class/net/*/ -name wireless 2>/dev/null)" ]; then
        notify-send "Connect Error" "No WiFi device found"
    else
        kitty sudo impala
    fi
    ;;
$BLUETOOTH)
    if ! rfkill list bluetooth | grep -qi "bluetooth"; then
        notify-send "Bluetooth Error" "No bluetooth device found"
    else
        if systemctl is-active bluetooth | grep -qi "inactive"; then
            notify-send "Bluetooth Error" "Bluetooth service is not running"
        else
            kitty bluetui
        fi
    fi
    ;;
*)
    exit 1
    ;;
esac
