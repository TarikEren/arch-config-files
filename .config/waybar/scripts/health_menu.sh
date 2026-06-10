#!/usr/bin/bash

source $HOME/.config/waybar/scripts/utils.sh

BACK=" Back"
UPDATE="󰚰 System Update"
BTOP="󰄨 Resource Monitor"
CURR_LOGS=" View Current Boot Errors"
FAIL_SERV=" View Failed Services"

options="$UPDATE\n$BTOP\n$CURR_LOGS\n$FAIL_SERV\n$BACK"
input=$(echo -e $options | walker --dmenu)

case "$input" in
$BACK)
    ~/.config/waybar/scripts/super_menu.sh
    ;;
$UPDATE)
    run_command 'sudo pacman -Syu && yay -Syu'
    ;;
$BTOP)
    kitty btop
    ;;
$CURR_LOGS)
    run_command 'journalctl -p 3 -b'
    ;;
$FAIL_SERV)
    run_command "systemctl --failed"
    ;;
esac
