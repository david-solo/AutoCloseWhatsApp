#!/bin/bash

# AutoCloseWhatsApp
# Closes WhatsApp when triggered by sleep, logout, or user switch.
# Designed for macOS with sleepwatcher.

LOG="$HOME/AutoCloseWhatsApp.log"

mkdir -p "$(dirname "$LOG")"

echo "$(date): Triggered by $1" >> "$LOG"

# Check if WhatsApp is running
if pgrep -x "WhatsApp" > /dev/null; then
    /usr/bin/osascript <<EOF >> "$LOG" 2>&1
tell application "WhatsApp" to quit
EOF
    echo "$(date): WhatsApp closed successfully" >> "$LOG"
else
    echo "$(date): WhatsApp not running" >> "$LOG"
fi

exit 0

