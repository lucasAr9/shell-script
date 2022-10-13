#!/bin/bash

# Un script que reciba como parámetro el nombre de un directorio. Deberá validar que
# el mismo exista y de no existir causar la terminación del script con código de error 4.
# Si el directorio existe deberá contar por separado la cantidad de archivos que en él se encuentran
# para los cuales el usuario que ejecuta el script tiene permiso de lectura y escritura, e informar
# dichos valores en pantalla. En caso de encontrar subdirectorios, no deberán procesarse, y
# tampoco deberán ser tenidos en cuenta para la suma a informar.


contar () {
    cd $1
    archivos=( $(ls) )
    cant_archivos=0
    cant_directorios=0

    for item in ${archivos[*]}; do
        if [ -f $item ]; then
            if [ -r $item ] && [ -w $item ]; then
                cant_archivos=$((cant_archivos + 1))
            fi
        elif [ -d $item ]; then
            if [ -r $item ] && [ -w $item ]; then
                cant_directorios=$((cant_directorios + 1))
            fi
        fi
    done

    echo "$(whoami) tiene permiso de lectura y escritura en ($cant_archivos) archivos, y ($cant_directorios) directorios."
}


if [ $# -ne 1 ]; then
    echo "El script debe recibir un directorio como parametro."
    exit 1
fi

if [ -d $1 ]; then
    contar $1
else
    echo "El directorio no existe."
    exit 4
fi

