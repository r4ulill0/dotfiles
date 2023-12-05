#/bin/sh
status=$(apcaccess status -p STATUS|tr -d ' ')
timeleft=$(apcaccess status -p TIMELEFT)
charge_percent=$(apcaccess status -p BCHARGE|cut -d '.' -f 1)
error_color="%{F#FF0000}"
default_color="%{F-}"
output=""
if [[ $status != "ONLINE" ]]; then
    output="%{F#FF0000}$status $charge_percent%a $timeleft%{F-}"
fi
printf "%s" "$output"
printf '\n'
