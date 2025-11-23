#!/bin/sh
# ~/.config/eww/scripts/bluetooth.sh

# Get connected Bluetooth devices and filter out system paths
connected_devices=$(bluetoothctl devices Connected 2>/dev/null | grep -v "/org/bluez/" | awk '{$1=""; $2=""; print $0}' | sed 's/^[ \t]*//')

if [ -n "$connected_devices" ]; then
    # Get the first connected device
    first_device=$(echo "$connected_devices" | head -n 1)
    echo "$first_device"
else
    echo "Offline"
fi