#!/bin/bash
set -euo pipefail
# Target
URL="https://raw.githubusercontent.com/vanilla-wiiu/vanilla/refs/heads/master/gui/res/com.mattkc.vanilla.desktop"
if ! TEXT_DATA=$(curl -sSL "$URL"); then
    echo "Error: Failed to fetch file from $URL" >&2
    exit 1
fi
echo "$TEXT_DATA"
if [[ -n "${GITHUB_OUTPUT:-}" ]]; then
    {
        echo "text_data<<EOF"
        echo "$TEXT_DATA"
        echo "EOF"
    } >> "$GITHUB_OUTPUT"
fi
