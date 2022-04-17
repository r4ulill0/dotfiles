export XDG_CONFIG_HOME=$HOME/.config
export ZK_NOTEBOOK_DIR=$HOME/zettelkasten-knowledge-database
export EDITOR=nvim
export LESSHISTFILE=$HOME/.cache/.lesshst

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
