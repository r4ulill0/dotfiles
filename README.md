# DOTFILES

## Notas a tener en cuenta en windows
 - Es necesario tener el modo desarrollador activado (al menos en w10) para tener acceso a la herramienta mklink. Y además esta solo está disponible en cmd.exe (no está en powershell por ejemplo) ya que es un built-in, no un ejecutable.
 - Debido a que en windows va todo muy mal, la única configuración que da soporte este repositorio es usando windows subsystem for linux (WSL). Hay que tener en cuenta que funciona muy mal al editar archivos que están fuera del subsistema, así que de momento es mejor evitarlo.

## Notas a tener en cuenta en linux
 - El enlace simbólico que nos interesa hacer es blando. Hay que recordar que en linux el enlace por defecto será duro, habrá que ejecutar ln -s  (soft).
 - Es necesario crear el directorio $HOME/wallpapers para poder tener los fondos de nitrogen al iniciar sesión
 - El script wifi-wakeup (para hacer funcionar el driver wifi MT7630E) necesita tener permisos de ejecución y estar en /lib/systemd/system-sleep/wifi-wakeup para funcionar. Con enlace simbólico funciona también.
## Instrucciones de configuración manual

 1. Clonar repositorio en una carpeta. Ej. git clone urldelrepositorio .dotfiles/
 2. Crear enlaces simbólicos en los lugares que corresponda que apunten a este repo local.
    Ej. Ponerse en el directorio ~\.config\nvim y hacer mklink init.vim ~/.dotfiles/init.vim
    Esto dejará sincronizadas las configuraciones en todo el sistema, haciendo más sencillo actualizar entre diferentes PC's
 3. Crear las variables del sistema necesarias para el correcto funcionamiento de las configuraciones (ver variables del sistema).
 4. Instalar los language servers que usará nvim como cliente para tener funcionalidades de IDE avanzadas

## Variables del sistema
 En la documentación son referenciadas con el prefijo $ pero en windows se definen sin él.
### Neovim / Vim

| Variable |Valor | Observaciones |
| -------- | ---- | ------------- |
| XDG_CONFIG_HOME | ~/.config | Solo es necesario en windows (aunque puede ser conveniente ponerlo en linux si no pilla la configuración de primeras), y en vez de ~ es mejor poner a mano C:\Users\usuario|
| LANG	| en_US.utf-8 | Esto afecta a la configuración de cómo se muestran las fechas para más info :help language|
| ZK_NOTEBOOK_DIR | ~/zettelkasten-knowledge-database | Exportada por defecto en .bashrc |

## TODOs

 - Crear un script que automatice la creación de los enlaces simbólicos
 - Añadir configuracion de vscode (?)
