# Script para iniciar la sesi�n en el display server (Xorg en este caso) despu�s de hacer login en tty1

if [[ "$(tty) == '/dev/tty1'" ]]; then
	exec startx
fi
