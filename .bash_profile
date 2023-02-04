#
# ~/.bash_profile
#

export XDG_CONFIG_HOME=$HOME/.config
export ZK_NOTEBOOK_DIR=$HOME/zettelkasten-knowledge-database
export EDITOR=nvim
export LESSHISTFILE=$HOME/.cache/.lesshst
export XCOMPOSEFILE=$XDG_CONFIG_HOME/.XCompose
export GTK_IM_MODULE=xim

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ "$(tty) == '/dev/tty1'" ]] && [ -z "$SSH_TTY" ]; then
       exec startx
fi
