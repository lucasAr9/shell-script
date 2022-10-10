#!/bin/bash

# Escriba un script que reciba una cantidad desconocida de parámetros al momento de su invocación
# (debe validar que al menos se reciba uno). Cada parámetro representa la ruta absoluta de un archivo
# o directorio en el sistema. El script deberá iterar por todos los parámetros recibidos, y verificar
# si el archivo o directorio existen en el sistema, imprimiendo en pantalla que tipo de objeto es (archivo o directorio).
# Además deberá informar la cantidad de archivos o directorios inexistentes en el sistema.

if [ $# -eq 0 ]; then
    echo "El script debe recibir al menos una ruta absoluta como parametro."
    exit 1
fi

no_exist=()

for ruta in $@; do
    if [ -d $ruta ]; then
        echo "========================="
        echo "$ruta: es un directorio con la siguiente informacion."
        echo "$(file $ruta)"
        echo "==="
    elif [ -f $ruta ]; then
        echo "========================="
        echo "$ruta: es un archivo con la siguiente informacion."
        echo "$(file $ruta)"
        echo "==="
    else
        no_exist+=($ruta)
    fi
done

if [ "${#no_exist[@]}" -gt 0 ]; then
    echo "==========================================="
    echo "${no_exist[@]}"
    echo "No existen"
    echo "==="
fi

