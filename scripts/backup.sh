#!/bin/bash

source ".config/env_var.sh"
# 20G en bytes
megasize=21474836480
IFS=":" read -r -a array <<< "$BACKUPDIRS"
echo "leido correctamente lista de directorios, detectados "${#arr[@]}
pacman -Qe > ${array[0]}/pacmanInstalled.txt
for index in ${!array[@]}
do
    echo "backing up: "${array[index]}
    bname="backup$index-$(date +%Y-%m-%d)"
    tarfile=$HOME"/bigfiles/"$bname".tar"
    zipfile=$HOME"/bigfiles/"$bname".tar.7z"
    echo $tarfile
    echo $zipfile
    cred=$(gpg -d --default-recipient-self $HOME/.gnupg/megacred.asc)
    tar -c -f $tarfile ${array[index]}
    7z a $zipfile $tarfile
    uploadsize=$(du -b $zipfile | awk -F' ' '{print $1}')
    if (( $uploadsize>$megasize )); then echo "El backup es más grande que el espacio disponible";return 1; fi
    sizes=($(rclone  ls --mega-user $(gpg -dq --default-recipient-self $HOME/.gnupg/megauser.asc| cat) --mega-pass $(gpg -dq --default-recipient-self $HOME/.gnupg/megacred.asc| cat|rclone obscure -) megaupload: | awk '{print $1}'))
    names=($(rclone  ls --mega-user $(gpg -dq --default-recipient-self $HOME/.gnupg/megauser.asc| cat) --mega-pass $(gpg -dq --default-recipient-self $HOME/.gnupg/megacred.asc| cat|rclone obscure -) megaupload: | awk '{print $2}'))
    i=0
    acumulated=0
    declare -a todelete
    while (( $acumulated<$uploadsize ))
    do
        acumulated=$(($acumulated + ${sizes[$i]}))
        todelete[$i]=${names[$i]}
        i=$(( $i+1 ))
    done
    echo "Se van a liberar "$acumulated" bytes en mega para poder subir los "$uploadsize" bytes del backup"
    for dfile in ${todelete[@]}
    do
        echo "Borrando del repositorio "$dfile" para hacer hueco"
        rclone  delete --mega-user $(gpg -dq --default-recipient-self $HOME/.gnupg/megauser.asc| cat) --mega-pass $(gpg -dq --default-recipient-self $HOME/.gnupg/megacred.asc| cat|rclone obscure -) megaupload:/$dfile
    done
    rclone  copy --mega-user $(gpg -dq --default-recipient-self $HOME/.gnupg/megauser.asc| cat) --mega-pass $(gpg -dq --default-recipient-self $HOME/.gnupg/megacred.asc| cat|rclone obscure -) $zipfile megaupload:
    rm $zipfile $tarfile
    echo ${array[index]}" backed up correctly"
done
# TODO if error > display it on next boot
# until the backup completes correctly
