
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

eval `ssh-agent -s`| 2>/dev/null
ssh-add $HOME/.ssh/github 2>/dev/null
