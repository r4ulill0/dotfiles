#!/bin/sh
# Modelo huion 1060P
# Vendor id:   256c:006d
# (deberían ser siempre así)				(estos ids pueden cambiar los pone Xorg al enchufar dispositivos)
# HID 256c:006d Pad                       	id=23	[slave  pointer  (2)]
# HID 256c:006d Pen Pen (0)               	id=26	[slave  pointer  (2)]
# HID 256c:006d Pen                       	id=25	[slave  keyboard (3)]

if $(xinput | rg -q 256c:006d); then
	CONNECTED_MONITORS=$(xrandr --query | grep " connected" | wc -l);
	echo "Monitores conectados: $CONNECTED_MONITORS";
	if  [ "$CONNECTED_MONITORS" -gt 1 ]; then
		echo "Pantalla externa conectada";
		# Pone el lapiz en el monitor indicado (el nombre del output en xrandr)
		xsetwacom --set "HID 256c:006d stylus" MapToOutput HDMI-1;
		xsetwacom --set "HID 256c:006d Pad pad" MapToOutput HDMI-1;
		xsetwacom --set "HID 256c:006d Touch Strip pad" MapToOutput HDMI-1;
		echo "Reposicionado cursor de tableta en HDMI-1";
	else
		xsetwacom --set "HID 256c:006d stylus" MapToOutput eDP-1;
		xsetwacom --set "HID 256c:006d Pad pad" MapToOutput eDP-1;
		xsetwacom --set "HID 256c:006d Touch Strip pad" MapToOutput eDP-1;
		echo "Reposicionado cursor de tableta en eDP-1";
		echo "no hay pantallas externas conectadas";
	fi
else
	echo "No hay tableta huion 1060P conectada, cancelando redirección de pantalla..."
fi

