#!/bin/bash

img=/tmp/swaylock.png

grim "$img"
convert "$img" -scale 20% -scale 1000% "$img"

swaylock -u -i "$img"
