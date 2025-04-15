#!/bin/bash

# Comprobamos que no falte ninguna dependecia
if [[ $(command -v mpv) ]]
then
    echo 'Bienvenido al despachador de grabaciones! Buscando archivos .oga, un momento...'
else
    echo "Es necesario mpv para ejecutar este script"
    exit 1
fi

regex='(^[0-9]{4})([0-9]{2})([0-9]{2})(.*)(_in_|_out_)(\+?[0-9]*)(_)?(.*)(\.oga$)'
# cargamos los archivos en un array para evitar problemas con los espacios en los nombres
archivos=()
IFS=$'\n' read -r -d '' -a archivos < <(  find . -name '*.oga' -printf '%f\n'|sort && printf '\0' )
echo $archivos

# Si hay txts de logs, damos la opción de borrarlos
if [[ $(find . -name '*.txt' |wc -l)>0 ]]
then

    read -p "Borrando logs txt, confirmar? [y/n]" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm *.txt
    fi
    echo 'Borrado'
fi

ITERACION=0
declare -a borrados
for file in "${archivos[@]}"
do
    let ITERACION=$ITERACION+1

    [[ $file =~ $regex ]]
    y=${BASH_REMATCH[1]}
    m=${BASH_REMATCH[2]}
    d=${BASH_REMATCH[3]}
    num=${BASH_REMATCH[6]}
    contact=${BASH_REMATCH[8]}
    duration=$(ffprobe -v quiet -sexagesimal -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 $file)

    echo "[$ITERACION/${#archivos[@]} ]-------------------------------"
    echo $d - $m - $y
    if [[ $contact ]] then echo $contact; fi
    if [[ $duration ]] then echo $duration; else echo "vacío"; fi
    echo $num
    echo -------------------------------
    mpv --no-terminal  "./$file" &
    reproduccion=$!
    pendiente=true
    while $pendiente
    do
        read -p "Abrir en reproductor[A] Guardar[G]  Eliminar[E] Ignorar/No hacer nada[N]" -n 1 -r
        if [[ $REPLY =~ ^[Aa]$ ]]
        then
            printf '\n Abriendo en reproductor...'
            kill -9 $reproduccion
            mpv --force-window --no-terminal "./$file" &
            let reproduccion=$!
        elif [[ $REPLY =~ ^[Gg]$ ]]
        then
            read -p "Nuevo nombre para $file (vacío para mantener):" NEWFILE
            if [[ $NEWFILE ]] then
                if [[ ! "dime.oga" =~ ".oga"$ ]] then
                    NEWFILE=$NEWFILE".oga"
                    echo "Añadida extensión, nombre corregido $NEWFILE"
                fi
                mv $file ../$NEWFILE
            else 
                mv $file ../
            fi
            echo "Guardado"
            let pendiente=false
        elif [[ $REPLY =~ ^[Ee]$ ]]
        then
            IFS=$'\n' borrados+=($file)
            rm $file
            echo
            echo "Borrado $file"
            let pendiente=false
        else
            let pendiente=false
        fi
    done
    echo
    kill -9 $reproduccion

    printf '\n\n\n\n'
done

for borrado in "${borrados[@]}"
do
    echo "borrado $borrado"
done

