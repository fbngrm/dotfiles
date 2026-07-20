#!/bin/bash

# Get battery percentage (Change 'BAT0' to 'BAT1' if needed)
battery_level=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}' | tr -d '%')

# Check if battery is 7% or lower AND not charging
status=$(upower -i $(upower -e | grep 'BAT') | grep -E "state" | awk '{print $2}')

if [ "$battery_level" -le 7 ] && [ "$status" != "charging" ] && [ "$status" != "fully-charged" ]; then
    notify-send -u critical "Battery Critical" "Level is ${battery_level}%. Suspending system..."
    sleep 2
    systemctl suspend
fi
