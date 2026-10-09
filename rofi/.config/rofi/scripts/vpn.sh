#!/usr/bin/env bash
export SUDO_ASKPASS=/home/alle/.config/rofi/scripts/sudo-askpass.sh

current="up"

if tailscale status --json | grep -i running; then
    sudo -A tailscale down
    current="down"
else
    sudo -A tailscale up
    current="up"
fi

notify-send VPN "Vpn $current"
