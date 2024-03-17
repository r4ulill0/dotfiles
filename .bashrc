#!/bin/bash
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

{ eval `ssh-agent -s`; ssh-add $HOME/.ssh/github; } &>/dev/null

# Importante poner los alias antes de los custom para poder pisar los generales
alias mv='mv -i'

#alias para añadir color
alias diff='diff --color=auto'
alias rg='rg --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
alias ls='ls --color=auto'

test -f $HOME/.config/custom_alias.sh && source $HOME/.config/custom_alias.sh
source $HOME/.config/colors.sh
# Para mostrar con el color del dolar si el resultado del anterior comando fue erroneo
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

# Modo vi activado por defecto (emacs te destroza los dedos con tanto Ctrl+Key
set -o vi
# Para editar la entrada de comandos en $EDITOR sin que se ejecute directamente
_edit_command_without_executing() {
    local editor="${EDITOR:-nano}"
    tmpf="$(mktemp)"
    printf '%s\n' "$READLINE_LINE" > "$tmpf"
    "$editor" "$tmpf"
    READLINE_LINE="$(<"$tmpf")"
    READLINE_POINT="${#READLINE_LINE}"
    rm -f "$tmpf"  # -f por si hay alias de rm='rm -i'
}
bind -m "vi" -x '"v":_edit_command_without_executing'
