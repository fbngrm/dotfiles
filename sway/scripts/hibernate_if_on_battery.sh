#!/bin/bash

ac_online=$(cat /sys/class/power_supply/ACAD/online 2>/dev/null)
if [ "$ac_online" != "1" ]; then
    systemctl hibernate
fi
