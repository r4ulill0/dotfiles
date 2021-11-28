#!/bin/sh

killall -q polybar
polybar mybar 2>&1 & disown

echo "Polybar launched..."
