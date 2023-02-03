
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

{ eval `ssh-agent -s`; ssh-add $HOME/.ssh/github; } &>/dev/null

