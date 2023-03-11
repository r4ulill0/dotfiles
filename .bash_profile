#
# ~/.bash_profile
#

source $HOME/.config/env_var.sh

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty) == '/dev/tty1'" ]] && [ -z "$SSH_TTY" ]; then
       exec startx
fi
