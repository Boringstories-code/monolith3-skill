#!/usr/bin/env bash
# install-sync.sh — install the three background sync jobs on this machine.
# Run once per machine. Idempotent: safe to re-run.
set -euo pipefail

VAULT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OS="$(uname -s)"

echo "Vault: $VAULT"

git -C "$VAULT" rev-parse --git-dir >/dev/null 2>&1 || {
  echo "Not a git repository. Run 'git init' and add a private remote first." >&2
  exit 1
}

git -C "$VAULT" config core.hooksPath scripts/optional/hooks-git
echo "Pre-push guard wired."

if [[ "$OS" == "Darwin" ]]; then
  command -v fswatch >/dev/null 2>&1 || {
    echo "Installing fswatch..."
    brew install fswatch
  }

  AGENTS="$HOME/Library/LaunchAgents"
  mkdir -p "$AGENTS"

  make_agent() {
    local label="$1" interval="$2" args="$3" watch="$4"
    local plist="$AGENTS/$label.plist"
    cat >"$plist" <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>$label</string>
  <key>ProgramArguments</key>
  <array>
    <string>$VAULT/scripts/optional/sync-brain.sh</string>
    <string>$args</string>
  </array>
  <key>WorkingDirectory</key><string>$VAULT</string>
  <key>StandardOutPath</key><string>$VAULT/logs/$label.out</string>
  <key>StandardErrorPath</key><string>$VAULT/logs/$label.err</string>
PLIST
    if [[ -n "$watch" ]]; then
      cat >>"$plist" <<PLIST
  <key>WatchPaths</key>
  <array><string>$VAULT</string></array>
  <key>ThrottleInterval</key><integer>20</integer>
PLIST
    else
      cat >>"$plist" <<PLIST
  <key>StartInterval</key><integer>$interval</integer>
PLIST
    fi
    cat >>"$plist" <<PLIST
</dict>
</plist>
PLIST
    launchctl unload "$plist" 2>/dev/null || true
    launchctl load "$plist"
    echo "  loaded $label"
  }

  mkdir -p "$VAULT/logs"
  make_agent "com.brain.watch" 0    "--fast" "yes"
  make_agent "com.brain.pull"  30   "--pull" ""
  make_agent "com.brain.full"  3600 "--full" ""

  echo
  echo "Done. Three agents running. Check with:  launchctl list | grep brain"

elif [[ "$OS" == "Linux" ]]; then
  UNITS="$HOME/.config/systemd/user"
  mkdir -p "$UNITS" "$VAULT/logs"

  make_unit() {
    local name="$1" args="$2" sec="$3"
    cat >"$UNITS/$name.service" <<UNIT
[Unit]
Description=Brain sync ($args)
[Service]
Type=oneshot
WorkingDirectory=$VAULT
ExecStart=$VAULT/scripts/optional/sync-brain.sh $args
UNIT
    cat >"$UNITS/$name.timer" <<UNIT
[Unit]
Description=Brain sync timer ($args)
[Timer]
OnBootSec=1min
OnUnitActiveSec=${sec}s
[Install]
WantedBy=timers.target
UNIT
    systemctl --user enable --now "$name.timer"
    echo "  enabled $name.timer"
  }

  make_unit "brain-pull" "--pull" 30
  make_unit "brain-full" "--full" 3600
  echo
  echo "Done. Note: no file watcher on Linux here — the 30s pull and hourly full pass cover it."
  echo "If you want instant commits, add an inotifywait loop calling sync-brain.sh --fast."
else
  echo "Unsupported OS: $OS. Run sync-brain.sh from cron or your scheduler of choice." >&2
  exit 1
fi
