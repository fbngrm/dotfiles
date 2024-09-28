#!/bin/bash

# Path to your Kitty configuration directory
KITTY_CONFIG="$HOME/.config/kitty"

# Choose your themes
LIGHT_THEME="$KITTY_CONFIG/kitty-themes/themes/gruvbox_light.conf"
DARK_THEME="$KITTY_CONFIG/kitty-themes/themes/gruvbox_dark.conf"
THEME="Gruvbox Light Hard"

# Choose the theme to apply based on an argument (light/dark)
case "$1" in
    light)
        cp "$LIGHT_THEME" "$KITTY_CONFIG/current-theme.conf"
        THEME="Gruvbox Light Hard"
        ;;
    dark)
        cp "$DARK_THEME" "$KITTY_CONFIG/current-theme.conf"
        THEME="Gruvbox Dark Hard"
        ;;
    *)
        echo "Usage: $0 {light|dark}"
        exit 1
esac

# export DISPLAY=:0   # or whatever your display is (check with `echo $DISPLAY`)
# export XAUTHORITY=/home/f/.Xauthority  # Replace `your_username` accordingly

THEME_FILE="$HOME/.config/kitty/current-theme.conf"

# Apply the theme by sending a command to all running kitty instances
kitty +kitten themes --reload-in=all "$THEME"
