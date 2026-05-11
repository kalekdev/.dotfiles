#!/usr/bin/env bash
set -euo pipefail

LIMIT=80
NIX_SHELL="$(command -v nix-shell 2>/dev/null || echo /nix/var/nix/profiles/default/bin/nix-shell)"

if [[ $EUID -ne 0 ]]; then
    exec sudo NIX_SHELL="$NIX_SHELL" bash "$0" "$@"
fi

fw() {
    "$NIX_SHELL" -p framework-tool --run "framework_tool $*"
}

current_output=$(fw "--charge-limit" 2>&1)
current=$(echo "$current_output" | grep -oP 'Maximum \K\d+')

echo "Current limit: ${current}%"

if [[ "$current" -lt 100 ]]; then
    fw "--charge-limit 100" > /dev/null
    echo "Charge limit removed (now 100%)"
else
    fw "--charge-limit ${LIMIT}" > /dev/null
    echo "Charge limit set to ${LIMIT}%"
fi
