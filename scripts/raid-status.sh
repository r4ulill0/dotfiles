#/bin/bash
if [[ /proc/mdstat ]] then
    awk '/^md/ {printf "%s: ", $1}; /blocks/ {printf "%s \n", $NF}' /proc/mdstat | sort
else
    echo "No RAID detected";
fi
