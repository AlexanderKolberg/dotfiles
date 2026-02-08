#!/bin/bash
# launch-or-focus: Launch an app if not running, or focus it if it is.
# Usage: launch-or-focus.sh <bundle-id> <app-name>
#
# Uses AeroSpace's list-windows to find the app's window and focus it
# (following it to whatever workspace it's on). If the app isn't running,
# launches it and lets on-window-detected handle workspace placement.

BUNDLE_ID="$1"
APP_NAME="$2"

if [ -z "$BUNDLE_ID" ] || [ -z "$APP_NAME" ]; then
    echo "Usage: $0 <bundle-id> <app-name>"
    exit 1
fi

WID=$(aerospace list-windows --all --app-bundle-id "$BUNDLE_ID" --format '%{window-id}' | head -1)

if [ -n "$WID" ]; then
    aerospace focus --window-id "$WID"
else
    open -a "$APP_NAME"
fi
