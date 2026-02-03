#!/bin/bash

LOGO_DIR="$HOME/.config/fastfetch/logos"

RANDOM_FILE=$(find "$LOGO_DIR" -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.txt" \) | shuf -n 1)

if [[ "$RANDOM_FILE" == *.png || "$RANDOM_FILE" == *.jpg || "$RANDOM_FILE" == *.jpeg ]]; then
    fastfetch --config ~/.config/fastfetch/config.jsonc --logo "$RANDOM_FILE" --logo-type kitty --logo-width 20 --logo-preserve-aspect-ratio true
elif [[ -f "$RANDOM_FILE" ]]; then
    fastfetch --config ~/.config/fastfetch/config.jsonc --logo "$RANDOM_FILE" --logo-type file
else
    # FALLBACK (No file found)
    echo "No logo found in $LOGO_DIR"
    fastfetch --config ~/.config/fastfetch/config.jsonc
fi
