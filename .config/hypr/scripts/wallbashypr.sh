#!/usr/bin/env sh

# set variables

ScrDir=`dirname "$(realpath "$0")"`
source $ScrDir/globalcontrol.sh
hypDir="${XDG_CONFIG_HOME:-$HOME/.config}/hypr/themes"

# regen color conf

if [ "$EnableWallDcol" -eq 1 ] ; then
    cp ${hypDir}/Wall-Dcol.lua ${hypDir}/colors.lua
else
    > ${hypDir}/colors.lua
fi

