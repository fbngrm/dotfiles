#!/bin/bash

# Skip blanking the screen via swayidle's timeout if audio is actively
# playing (browser video, media players, etc.), since not all apps
# reliably use the wayland idle-inhibit protocol under sway.
if pactl list sink-inputs | grep -q "Corked: no"; then
    exit 0
fi

swaymsg "output * dpms off"
