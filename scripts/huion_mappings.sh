#!/bin/sh


# BOTONES SUPERIORES PARA ACCIONES DE EDICION
xsetwacom set "HID 256c:006d pad" Button 1 key "ctrl shift alt z"; # Deshacer
xsetwacom set "HID 256c:006d pad" Button 2 key "ctrl shift alt u"; # Rehacer
xsetwacom set "HID 256c:006d pad" Button 3 key "ctrl";
xsetwacom set "HID 256c:006d pad" Button 8 key "shift";
xsetwacom set "HID 256c:006d pad" Button 9 key "m"; # Efecto espejo
xsetwacom set "HID 256c:006d pad" Button 10 key "ctrl shift alt d";

# BOTONES BAJOS PARA ACCIONES DE GESTION
xsetwacom set "HID 256c:006d pad" Button 11 key "ctrl shift alt r";
xsetwacom set "HID 256c:006d pad" Button 12 key "ctrl shift alt u";
xsetwacom set "HID 256c:006d pad" Button 13 key "ctrl shift alt u";
xsetwacom set "HID 256c:006d pad" Button 14 key "ctrl shift alt u";
xsetwacom set "HID 256c:006d pad" Button 15 key "ctrl shift alt u";
xsetwacom set "HID 256c:006d pad" Button 16 key "ctrl shift alt u";
