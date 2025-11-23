#!/bin/sh
# ~/.config/eww/scripts/wifi-strength.sh

# Get WiFi signal strength using NetworkManager
signal=$(nmcli -t -f active,signal dev wifi | grep '^yes' | cut -d: -f2)

if [ -n "$signal" ]; then
    # Convert signal strength to an icon
    if [ "$signal" -ge 80 ]; then
        echo "󰤨"  # Excellent signal
    elif [ "$signal" -ge 60 ]; then
        echo "󰤥"  # Good signal
    elif [ "$signal" -ge 40 ]; then
        echo "󰤢"  # Medium signal
    elif [ "$signal" -ge 20 ]; then
        echo "󰤟"  # Weak signal
    else
        echo "󰤯"  # Very weak signal
    fi
else
    echo "󰤮"  # Disconnected
fi