#!/bin/sh
# ~/.config/eww/scripts/wifi.sh

# Get WiFi SSID using NetworkManager
ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2- 2>/dev/null)

if [ -n "$ssid" ]; then
    echo "$ssid"
else
    echo "Disconnected"
fi