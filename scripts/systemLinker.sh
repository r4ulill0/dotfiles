#!/bin/sh

# TODO Comprobar que el directorio actual tiene acceso directo a .dotfiles y si no cerrar

# TODO poner un modo de ejecución para eliminar el archivo existente y sustituirlo por el enlace
# TODO asegurarse de que se usan rutas absolutas o fallará por no llegar al archivo de dotfiles
ln -s $HOME/.dotfiles/.bashrc .bashrc
ln -s $HOME/.dotfiles/.bash_profile .bash_profile
ln -s $HOME/.dotfiles/.config/ .config
ln -s $HOME/.dotfiles/.xinitrc .xinitrc
