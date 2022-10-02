#!/bin/bash

# (c) Crear un script que reciba como parámetro el nombre de un archivo e informe si el
# mismo existe o no, y en caso afirmativo indique si es un directorio o un archivo. En
# caso de que no exista el archivo/directorio cree un directorio con el nombre recibido
# como parámetro.

if [ $# -ne 1 ]; then
    echo "Los parametros son incorrectos."
    exit 1
fi

if [ -d "$1" ]; then
    echo "$1 es un directorio."
elif [ -f "$1" ]; then
    echo "$1 es un archivo."
else
    echo "$1 no existe."
fi
