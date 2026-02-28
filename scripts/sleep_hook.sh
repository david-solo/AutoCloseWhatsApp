#!/bin/bash

# Sleep hook for sleepwatcher
# This script triggers the main WhatsApp close script

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"$SCRIPT_DIR/quit_whatsapp_on_event.sh" sleep


