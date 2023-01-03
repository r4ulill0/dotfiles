# Script para iniciar la sesión en el display server (Xorg en este caso) después de hacer login en tty1

if [[ "$(tty) == '/dev/tty1'" ]] && [ -z "$SSH_TTY" ]; then
	exec startx
fi
