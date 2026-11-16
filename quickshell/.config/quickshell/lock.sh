#!/usr/bin/env bash

set -euo pipefail

lock_path="${XDG_CONFIG_HOME:-$HOME/.config}/quickshell/lock.qml"

if pgrep -f "[q]s -p ${lock_path}" >/dev/null; then
    exit 0
fi

exec qs -p "$lock_path"
