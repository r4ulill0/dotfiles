#/bin/sh
errores=$(systemctl --user list-units --failed|rg backup| wc -l)
output=""
if (($errores > 0)); then
    output="%{F#FF0000}Han fallado unidades de systemd %{F-}"
fi
printf "%s" "$output"
printf '\n'

