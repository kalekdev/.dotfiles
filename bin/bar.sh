#!/usr/bin/env bash

# Example: 1hour, 15 minutes
uptime_formatted=$(uptime -p | cut -d " " -f2-)

ssid=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | awk -F: '{print $2} ')
ip=$(hostname -I | cut -d' ' -f1)

if wpctl status | grep "*" | grep -q 'MUTED'; then
  volume_formatted=Muted
else
  # Example: 50%
  volume=$(echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@) | awk -F": " '{print $2 * 100 "%"}')
  sound_output=$(wpctl inspect @DEFAULT_AUDIO_SINK@| grep 'api' --max-count=1)

  if [[ "$sound_output" =~ "bluez" ]]; then
	  volume_formatted="$volume (Bluetooth)"
  else
	  volume_formatted="$volume (Line Out)"
  fi
fi


if [ -d "/sys/class/power_supply/BAT0" ]; then
	battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
	battery_status=$(cat /sys/class/power_supply/BAT0/status)
	battery_formatted=" | Battery: "$battery_capacity"% ($battery_status)"
fi

# Example: Mon 2024-07-28 09:11:00
date_formatted=$(date "+%a %F %H:%M:%S")

echo "Uptime: $uptime_formatted | $ssid$ip | Volume: $volume_formatted$battery_formatted | $date_formatted"
