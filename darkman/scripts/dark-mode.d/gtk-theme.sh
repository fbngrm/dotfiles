#!/usr/bin/env bash
# Note: The names for the Arc theme variations are terrible.
# "Darker" is actually LESS DARK than "Dark".

# gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
xfconf-query -c xsettings -p /Net/ThemeName -s "Adwaita-dark"
