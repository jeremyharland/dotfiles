#!/bin/bash

# Get the URL under the cursor (requires some application-specific logic)
url=$(xclip -o)

# Open the URL with the specified browser profile
firefox -P Mosh "$url"
