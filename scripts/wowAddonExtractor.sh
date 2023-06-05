#!/bin/bash
set -x

wowDir="$HOME/Games/battlenet/drive_c/Program Files (x86)/World of Warcraft/_classic_/Interface/AddOns/"

temp=tempWowAddonExtracto

echo Copiando zips a una carpeta aislada

mkdir $temp

cp *.zip $temp/

echo Extrayendo zips...

unzip -o "$temp/*.zip" -d $temp
rm $temp/*.zip

echo Moviendo archivo al destino $wowDir
cp -r $temp/* "$wowDir"

echo Borrando carpeta temporal

rm -rf $temp

echo Fin
