#!/bin/bash

getPendingCalls() {
    callpath="$HOME/gestion/docs/imagenes/fotos/inbox"
    pending_call=$(ls -1 $callpath | wc -l)
    echo $pending_call
}

getPendingImages() {
    imgpath="$HOME/gestion/docs/importante/llamadas-grabadas/inbox"
    pending_images=$(ls -1 $imgpath | wc -l)
    echo $pending_images
}

case $1 in
    "call")
    getPendingCalls;
    ;;
"image") 
    getPendingImages;
    ;;
*)
    echo "Usage: media-sync-status [call|image]"
esac

