# AutoCloseWhatsApp

Automatically closes WhatsApp on macOS when:

- MacBook lid is closed
- System enters sleep
- User logs out
- User switches account

This prevents WhatsApp from keeping the Mac awake and draining the battery.

---

## Problem

In some cases WhatsApp can prevent macOS from entering sleep mode.

If you close your MacBook lid while the computer is not connected to a charger, the system may remain active in the background. As a result, the battery may slowly drain even though the laptop appears to be asleep.

This project solves that problem by automatically closing WhatsApp before macOS enters sleep mode.

---

## Requirements

You need:

- macOS
- Terminal access
- Bash (default macOS shell)
- AppleScript (built into macOS)

Optional but recommended:

- Homebrew
- sleepwatcher

If you are not a programmer, the steps below explain everything.

---

## How This Works

The automation works as follows:

1. A utility called sleepwatcher listens for macOS sleep events.
2. When the system is about to sleep, it runs a hidden file called `.sleep`.
3. That file executes a script from this repository.
4. The script checks whether WhatsApp is currently running.
5. If WhatsApp is running, the script safely closes it using AppleScript.

This ensures that WhatsApp cannot block the system from going to sleep.

---

## Installation Guide

Follow the steps below in Terminal.

Open Terminal by pressing:

Command + Space → type "Terminal"

---

### Step 1 — Install Homebrew (if you don't have it)

Homebrew is a package manager for macOS. It is used here to install sleepwatcher.

Run:

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Verify installation:

brew --version

Expected output:

Homebrew 4.x.x

If Homebrew is already installed you can skip this step.

---

### Step 2 — Install sleepwatcher

Run:

brew install sleepwatcher

Verify installation:

brew list | grep sleepwatcher

Expected result:

sleepwatcher

---

### Step 3 — Copy the Sleep Script

macOS uses a hidden file called:

~/.sleep

The ~ symbol refers to your home directory.

Example:

/Users/YOUR_USERNAME

If you are unsure what your username is, run:

whoami

Inside this project you will find:

scripts/sleep_hook.sh

Copy it to your home directory as `.sleep`:

cp scripts/sleep_hook.sh ~/.sleep

---

### Step 4 — Make the Script Executable

Allow macOS to execute the `.sleep` script automatically.

Run:

chmod +x ~/.sleep

Verify permissions:

ls -l ~/.sleep

Expected output:

-rwxr-xr-x

---

### Step 5 — Start sleepwatcher

Start sleepwatcher as a background service so it runs automatically when you log into your Mac.

Run:

brew services start sleepwatcher

Verify it is running:

brew services list

Expected result:

sleepwatcher started YOUR_USERNAME

---

### Step 6 — Test the Automation

1. Open WhatsApp
2. Close your MacBook lid
3. Open the laptop again

Expected result:

WhatsApp should be closed automatically.

---

## Multi-User Setup

If multiple people use the same Mac, each user account must repeat the installation steps.

This is because the `.sleep` file exists inside each user's home directory:

/Users/USERNAME

Each user account has its own sleep hooks.

---

## Project Structure

scripts/

Files inside:

sleep_hook.sh  
quit_whatsapp_on_event.sh

sleep_hook.sh — Triggered by sleepwatcher when macOS is about to sleep.  
quit_whatsapp_on_event.sh — Safely closes WhatsApp if it is running.

Both scripts use Bash and AppleScript, which are built into macOS.

---

## Technical Highlights

- Uses macOS sleep event hooks
- Integrates Bash with AppleScript
- Uses sleepwatcher for automation
- Lightweight solution with almost zero CPU usage
- Works on multi-user systems
- Supports multi-user macOS setups
- Includes logging for debugging and traceability

---

## Why This Project Exists

While using macOS I noticed that WhatsApp sometimes prevented the system from entering sleep mode.

When the MacBook lid was closed while running on battery power, the system sometimes remained active in the background. This caused gradual battery drain even though the laptop appeared to be asleep.

This project was created to enforce predictable system behavior and improve power management.

---

## Version

Current version: v1.0.0

---

## License

MIT License

This means anyone can freely use, copy, modify, and share this project for personal or commercial purposes, without asking me for permission. I do not require any payment or credit, though giving credit is appreciated.
