#!/bin/sh
# 1. The most important line for Firefox/Chromium/GTK4:
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

# 2. For standard GTK3 apps:
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

# 3. For Qt apps (if you use adwaita-qt):
export QT_QPA_PLATFORMTHEME=gnome
