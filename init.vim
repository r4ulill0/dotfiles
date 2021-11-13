set helplang=es,en	"Cuando se abra la ayuda, primero intentar abrirla en castellano y luego en inglés
set relativenumber 	"Activa los números que muestran la posicion relativa
set number		"Pone el número de línea en la línea del cursor
set hidden 		"Te permite dejar buffers en segundo plano con ediciones sin guardar
set encoding=utf-8
set tabstop=4		"-
set softtabstop=4 	" |-La tabulacion es 4 espacios (tanto automática como al apretar TAB)
set shiftwidth=4	"-
set smartindent		"Auto indentado
set expandtab		"Convierte las tabulaciones en espacios
set exrc		"Coge la configuración local del directorio (init.vim) en vez de cualquier otra
set nohlsearch		"Desactiva el iluminado de búsqueda después de buscar (mientras escribes la búsqueda sí que funciona)
set nowrap		"Desactiva el truncado de línea cuando se supera el ancho de ventana
set ignorecase		"_
set smartcase		"_|- Hace búsquedas sensibles a mayúsculas solo si usas mayúsculas en la búsqueda
set noswapfile		"Desactiva los archivos de swap (son ultra molestos)
set nobackup		"Desactiva los backups parcialmente (:help backup para más info)
set scrolloff=8		"Empieza a hacer scroll X líneas antes de llegar a los límites de la ventana
set signcolumn=yes	"Añade una columna adicional para símbolos (las marcas de error del linter por ejemplo)
set colorcolumn=80	"Marca la columna 80. Útil para saber cuando estás identando mucho y toca refactor
set updatetime=50	"Tiempo de refresco del archivo de backup en milisegundos


"set shortmess		"Esto deshabilita ciertos mensajes de error de principiante
syntax on

call plug#begin($HOME . '/.vim/plugged')
"Los plugins van aqui
call plug#end()
