#!/bin/sh

font tty-hack
# Descomentar para poder debuggear
#exec i3 --shmlog-size=26214400 &> $HOME/logMaster.txt
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


pulseaudio --start
exec i3
