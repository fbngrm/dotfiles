#!/bin/bash

# Adjust the external monitor's brightness via DDC/CI (requires ddcutil).
# Usage: ext_brightness.sh +5 | -5 | 50   (relative or absolute percent)

# Key repeat starts calls faster than the monitor answers DDC; drop the extras
# instead of letting ddcutil processes pile up on the I2C bus.
exec 9>"${XDG_RUNTIME_DIR:-/tmp}/ext_brightness.lock"
flock -n 9 || exit 0

delta="$1"

# `ddcutil getvcp 10 --brief` prints: VCP 10 C <current> <max>
current=$(timeout 5 ddcutil getvcp 10 --brief 2>/dev/null | awk '{print $4}')
[ -z "$current" ] && exit 1

if [[ "$delta" =~ ^[+-][0-9]+$ ]]; then
    new=$(( current + delta ))
else
    new="$delta"
fi

(( new < 0 )) && new=0
(( new > 100 )) && new=100

timeout 5 ddcutil setvcp 10 "$new"
