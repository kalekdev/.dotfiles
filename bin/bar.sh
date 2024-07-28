# Example: 1hour, 15 minutes
uptime_formatted=$(uptime -p | cut -d " " -f2-)

ssid=$(nmcli -t -f active,ssid dev wifi | egrep '^yes' | awk -F: '{print $2} ')
ip=$(hostname -I | cut -d' ' -f1)

# TODO: Currently selected output
if wpctl status | grep -q 'MUTED'; then
  volume=Muted
else
  # Example: 50%
  volume=$(echo $(wpctl get-volume @DEFAULT_AUDIO_SINK@) | awk -F": " '{print $2 * 100 "%"}')
fi

battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

if [ -d "/sys/class/power_supply/BAT0" ]; then
  battery_format="| Battery: "$battery_capacity"% ($battery_status)"
fi

# Example: Mon 2024-07-28 09:11:00
date_formatted=$(date "+%a %F %H:%M:%S")

echo "Uptime: $uptime_formatted | $ssid$ip | Volume: $volume $battery_format | $date_formatted"
