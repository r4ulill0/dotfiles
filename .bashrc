#!/bin/bash
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

{ eval `ssh-agent -s`; ssh-add $HOME/.ssh/github; } &>/dev/null

source $HOME/.config/colors.sh
PROMPT_COMMAND=__prompt_command
__prompt_command() {
    local SALIDA="$?"
    PS1="\n${colYellow}{\u}${colWhite}[\W]"

    if [ $SALIDA != 0 ]; then
        PS1+="${colRed}\$"
    else
        PS1+="${colGreen}\$"
    fi

    PS1+="${colReset}\n"
}
