#!/usr/bin/env bash
# Persistia — Scheduler Setup
# Installs the queue runner to fire every 15 minutes.
# macOS: launchd (runs missed jobs on wake)
# Linux: systemd user timer (Persistent=true — runs missed jobs on boot)
# Windows: prints manual instructions

set -e

PROJECT_DIR="$(cd "$(dirname "$0")/../.." && pwd)" # script lives at _brain/scripts/, project root is two levels up
RUNNER="$PROJECT_DIR/_brain/scripts/queue-runner.mjs"
LOG_DIR="$PROJECT_DIR/_brain/scripts"
LOG_FILE="$LOG_DIR/queue-runner.log"

mkdir -p "$LOG_DIR"

OS="$(uname -s)"

echo ""
echo "  Setting up scheduler for: $PROJECT_DIR"
echo "  OS detected: $OS"
echo ""

case "$OS" in

  Darwin)
    LABEL="io.persistia.queue-runner.$(basename "$PROJECT_DIR")"
    PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"

    # Unload existing if present
    launchctl unload "$PLIST" 2>/dev/null || true

    cat > "$PLIST" << PLIST_EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key>
  <string>$LABEL</string>
  <key>ProgramArguments</key>
  <array>
    <string>/usr/bin/env</string>
    <string>node</string>
    <string>$RUNNER</string>
  </array>
  <key>WorkingDirectory</key>
  <string>$PROJECT_DIR</string>
  <key>StartInterval</key>
  <integer>900</integer>
  <key>RunAtLoad</key>
  <true/>
  <key>StandardOutPath</key>
  <string>$LOG_FILE</string>
  <key>StandardErrorPath</key>
  <string>$LOG_FILE</string>
  <key>EnvironmentVariables</key>
  <dict>
    <key>PATH</key>
    <string>/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin</string>
    <key>HOME</key>
    <string>$HOME</string>
  </dict>
</dict>
</plist>
PLIST_EOF

    launchctl load "$PLIST"
    echo "  ✅ Scheduler installed (macOS launchd)"
    echo "     Runs every 15 minutes. Catches up on wake from sleep."
    echo "     Plist: $PLIST"
    ;;

  Linux)
    UNIT_DIR="$HOME/.config/systemd/user"
    mkdir -p "$UNIT_DIR"
    UNIT_NAME="persistia-$(basename "$PROJECT_DIR")"

    cat > "$UNIT_DIR/$UNIT_NAME.service" << SERVICE_EOF
[Unit]
Description=Persistia Queue Runner — $(basename "$PROJECT_DIR")

[Service]
Type=oneshot
ExecStart=/usr/bin/env node $RUNNER
WorkingDirectory=$PROJECT_DIR
StandardOutput=append:$LOG_FILE
StandardError=append:$LOG_FILE
SERVICE_EOF

    cat > "$UNIT_DIR/$UNIT_NAME.timer" << TIMER_EOF
[Unit]
Description=Persistia — Run every 15 minutes ($(basename "$PROJECT_DIR"))

[Timer]
OnBootSec=1min
OnUnitActiveSec=15min
Persistent=true

[Install]
WantedBy=timers.target
TIMER_EOF

    systemctl --user daemon-reload
    systemctl --user enable --now "$UNIT_NAME.timer"
    echo "  ✅ Scheduler installed (Linux systemd)"
    echo "     Runs every 15 minutes. Persistent=true catches up on reboot."
    echo "     Units: $UNIT_DIR/$UNIT_NAME.*"
    ;;

  MINGW*|MSYS*|CYGWIN*)
    echo "  ⚠️  Windows detected."
    echo "     Automatic setup not yet supported. To run manually:"
    echo ""
    echo "     node $RUNNER"
    echo ""
    echo "     To schedule it, add a Task Scheduler entry with:"
    echo "     Trigger: Every 15 minutes"
    echo "     Action:  node $RUNNER"
    echo "     Setting: Run task as soon as possible after a scheduled start is missed"
    ;;

  *)
    echo "  ⚠️  Unsupported OS: $OS"
    echo "     Run the queue runner manually: node $RUNNER"
    ;;
esac

echo ""
