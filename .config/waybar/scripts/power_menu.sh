#!/usr/bin/bash

SHUTDOWN="󰐥 Shutdown"
REBOOT="󰑐 Reboot"
SLEEP="󰤄 Sleep"
LOCK="󰌾 Lock"
BACK=" Back"

options="$SHUTDOWN\n$REBOOT\n$SLEEP\n$LOCK\n$BACK"
input=$(echo -e $options | walker --dmenu)

case "$input" in
$BACK)
    ~/.config/waybar/scripts/super_menu.sh
    ;;
$SHUTDOWN)
    shutdown now
    ;;
$REBOOT)
    reboot
    ;;
$SLEEP)
    systemctl hibernate
    ;;
$LOCK)
    hyprlock
    ;;
*)
    exit 1
    ;;
esac
