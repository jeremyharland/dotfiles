#!/bin/bash

# Check if Mullvad VPN is currently connected
if mullvad status | grep -q "Disconnected"; then
    # If disconnected, connect
    mullvad connect
else
    # If connected, disconnect
    mullvad disconnect
fi
