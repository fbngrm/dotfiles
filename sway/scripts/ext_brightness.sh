#!/bin/bash

# Adjust the external monitor's brightness via DDC/CI (requires ddcutil).
# Usage: ext_brightness.sh +5 | -5 | 50   (relative or absolute percent)

delta="$1"

# `ddcutil getvcp 10 --brief` prints: VCP 10 C <current> <max>
current=$(ddcutil getvcp 10 --brief 2>/dev/null | awk '{print $4}')
[ -z "$current" ] && exit 1

if [[ "$delta" =~ ^[+-][0-9]+$ ]]; then
    new=$(( current + delta ))
else
    new="$delta"
fi

(( new < 0 )) && new=0
(( new > 100 )) && new=100

ddcutil setvcp 10 "$new"
