# AutoCloseWhatsApp

Automatically closes WhatsApp on macOS when:

- MacBook lid is closed
- System enters sleep
- User logs out
- User switches account

## Problem

WhatsApp can prevent macOS from entering sleep mode.
If the lid is closed while not charging, the battery may drain completely.

This project solves that problem using:

- Bash
- AppleScript
- sleepwatcher

## Installation

1. Install sleepwatcher via Homebrew:
   brew install sleepwatcher

2. Copy sleep_hook.sh to ~/.sleep

3. Start service:
   brew services start sleepwatcher

## License

MIT
