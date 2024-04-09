#!/bin/sh

area=$(slop)
TMPFILE=$HOME"/.cache/custom_scripts/vn-ocr.png"
FREQ=5

echo "Interrumpe para salir, se está creando una captura en $TMPFILE \n frecuencia establecida en $FREQ segundos"

while true
do
    maim -g $area $TMPFILE
    tesseract -l jpn $TMPFILE stdout |tr -d ' ' |xclip -selection clipboard
    sleep $FREQ
done
