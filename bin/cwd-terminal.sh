#!/usr/bin/env bash

# Opens foot in the same CWD
focused=$(swaymsg -t get_tree | jq '.. | select(.focused)? | .pid')
cd -P /proc/$(pgrep -P "$focused" | head -n 1)/cwd
exec foot
