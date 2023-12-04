#/bin/sh


devices_paired=$(bluetoothctl devices Connected | grep Device | cut -d ' ' -f 2)
counter=0

for device in $devices_paired; do
    device_info=$(bluetoothctl info "$device")

    if echo "$device_info" | grep -q "Connected: yes"; then
        device_output=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
        device_battery_percent=$(echo "$device_info" | grep "Battery Percentage" | awk -F'[()]' '{print $2}')

        if [ -n "$device_battery_percent" ]; then
            if [ "$device_battery_percent" -gt 35 ]; then
                device_battery_format="%{F#00FF00}"
            else
                device_battery_format="%{F#FF0000}"
            fi

            device_output="$device_output $device_battery_format$device_battery_percent%%{F-}"
        fi

        if [ $counter -gt 0 ]; then
            printf ", %s" "$device_output"
        else
            printf " %s" "$device_output"
        fi

        counter=$((counter + 1))
    fi
done

printf '\n'
