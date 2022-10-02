#!/bin/bash


# Para crear las carpetas de prueba
crear_carpeta() {
    mkdir carpeta_punto_14
    cd carpeta_punto_14 || exit
    for((i=0;i<5;i++)); do
        touch "archivo$i.txt"
    done    
}


# 14. Renombrando Archivos: un script que renombre solo archivos de un directorio pasado
# como parametro agregandole una CADENA, contemplando las opciones:
# “-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del archivo
# “-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre del archivo
cambiar_nombre() {
    archivos=$(ls ./"$1")

    if [ "$2" == "-a" ]; then
        agregar_final "$archivos" "$1" "$3"
    elif [ "$2" == "-b" ]; then
        agregar_principio "$archivos" "$1" "$3"
    else
        echo "El parametro \"$2\" es incorrecto"
    fi
}


agregar_principio() {
    for item in $1; do
        echo "${2}${item}"
    done
}


agregar_principio() {
    for item in $1; do
        echo "${2}${item}"
    done
}


# crear_carpeta

if [ $# != 3 ]; then
    echo "Los parametros son incorrectos"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "El directorio \"$1\" no existe"
    exit 2
fi

cambiar_nombre "$1" "$2" "$3"
