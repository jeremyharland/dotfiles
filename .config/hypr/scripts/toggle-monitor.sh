#!/usr/bin/env sh

if hyprctl monitors | grep -q "DP-1"; then
  hyprctl keyword monitor "DP-1,disable"
else
  hyprctl keyword monitor "DP-1,2560x1440@165,1080x0,1,bitdepth,10"
fi
