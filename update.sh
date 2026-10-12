#!/usr/bin/env bash
# Pull the kit, then run the installer again. Notes you already wrote stay.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
git pull --ff-only
exec bash install.sh "$@"
