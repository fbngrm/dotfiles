#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar
#
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

MONITOR=eDP-1 polybar bar1 | tee -a /tmp/polybar1.log & disown
MONITOR=DP-1 polybar bar1 | tee -a /tmp/polybar2.log & disown

# if type "xrandr" > /dev/null; then
#     for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#         echo "Monitor detected: $m" >> ~/.config/polybar/polybar.log
#         MONITOR=$m polybar --reload bar1 >> ~/.config/polybar/polybar.log 2>&1 &
#     done
# else
#     echo "xrandr not found, launching Polybar on default monitor" >> ~/.config/polybar/polybar.log
#     polybar --reload bar1 >> ~/.config/polybar/polybar.log 2>&1 &
# fi

echo "Polybar launched on all monitors" >> ~/.config/polybar/polybar.log
