# DOTFILES

## Notas a tener en cuenta en windows
 - Es necesario tener el modo desarrollador activado (al menos en w10) para tener acceso a la herramienta mklink. Y además esta solo está disponible en cmd.exe (no está en powershell por ejemplo) ya que es un built-in, no un ejecutable.

## Notas a tener en cuenta en linux
 - El enlace simbólico que nos interesa hacer es blando. Hay que recordar que en linux el enlace por defecto será duro, habrá que ejecutar ln -s  (soft).

## Instrucciones de configuración manual

 1. Clonar repositorio en una carpeta. Ej. git clone urldelrepositorio .dotfiles/
 2. Crear enlaces simbólicos en los lugares que corresponda que apunten a este repo local.
    Ej. Ponerse en el directorio ~\.config\nvim y hacer mklink init.vim ~/.dotfiles/init.vim
    Esto dejará sincronizadas las configuraciones en todo el sistema, haciendo más sencillo actualizar entre diferentes PC's
 3. Crear las variables del sistema necesarias para el correcto funcionamiento de las configuraciones (ver variables del sistema).

## Variables del sistema
 En la documentación son referenciadas con el prefijo $ pero en windows se definen sin él.
### Neovim / Vim
 - XDG_CONFIG_HOME  ~/.config   (solo es necesario en windows, y en vez de ~ es mejor poner a mano C:\Users\usuario)
 - LANG		    en_US.utf-8 (Esto afecta a la configuración de cómo se muestran las fechas para más info :help language)

## TODOs

 - Crear un script que automatice la creación de los enlaces simbólicos
 - Añadir fuente y personalizacion estética al init.vim
 - Añadir configuracion de vscode (?)
