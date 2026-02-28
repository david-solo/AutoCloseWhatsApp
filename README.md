# AutoCloseWhatsApp

Automatically closes WhatsApp on macOS when:

- MacBook lid is closed
- System enters sleep
- User logs out
- User switches account

---

## Problem

WhatsApp can prevent macOS from entering sleep mode.

If the lid is closed while not charging, the battery may drain completely.

This project solves that problem using a lightweight automation approach.

---

## Requirements

- macOS
- Bash (default shell)
- AppleScript (built-in)
- Optional: Homebrew + sleepwatcher

---

## Installation

1. Install sleepwatcher via Homebrew:

   brew install sleepwatcher

2. Copy `sleep_hook.sh` to:

   ~/.sleep

3. Make it executable:

   chmod +x ~/.sleep

4. Start service:

   brew services start sleepwatcher

---

## How It Works

- sleepwatcher triggers `.sleep`
- `.sleep` calls `quit_whatsapp_on_event.sh`
- Script checks if WhatsApp is running
- If running → it quits safely via AppleScript

---

## License

MIT License