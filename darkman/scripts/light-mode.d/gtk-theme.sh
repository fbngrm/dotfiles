#!/bin/sh

# 1. Tell Modern Apps (Firefox/Chromium/GTK4) to use Light Mode
# 'default' is the standard value for light mode in the XDG spec
gsettings set org.gnome.desktop.interface color-scheme 'default'

# 2. Set the specific GTK3 theme (Adwaita is the reliable default)
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

# 3. Optional: Set the Icon theme if you use a specific light version
# gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'

# 4. Force a sync of the portal environment (Optional but helpful for Sway)
dbus-update-activation-environment --systemd --all

