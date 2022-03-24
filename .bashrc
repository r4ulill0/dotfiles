export XDG_CONFIG_HOME=$HOME/.config

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
