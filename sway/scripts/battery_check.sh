#!/bin/bash

# Skip entirely when plugged in (charge-limit firmware can report the
# battery as "not charging" even on AC, so check the AC adapter directly
# instead of trusting upower's charging state).
ac_online=$(cat /sys/class/power_supply/ACAD/online 2>/dev/null)

# Tracks whether the 15% warning was already shown, so it doesn't repeat
# every 60s while the battery sits between 15% and 10%.
warn_flag=/tmp/battery-low-warned
if [ "$ac_online" = "1" ]; then
    rm -f "$warn_flag"
    exit 0
fi

# Get battery percentage (Change 'BAT0' to 'BAT1' if needed)
battery_level=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | awk '{print $2}' | tr -d '%')

if [ "$battery_level" -le 15 ] && [ ! -f "$warn_flag" ]; then
    notify-send -u critical "Battery Low" "Battery at ${battery_level}%. System will hibernate at 10% unless plugged in."
    touch "$warn_flag"
fi

if [ "$battery_level" -le 10 ]; then
    notify-send -u critical "Battery Critical" "Level is ${battery_level}%. Hibernating system..."
    sleep 2
    systemctl hibernate
fi
