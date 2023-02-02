#!/bin/bash


# Para crear las carpetas de prueba
crear_carpeta() {
    nombre_carpeta="reemplazar_principio"
    mkdir $nombre_carpeta
    cd $nombre_carpeta || exit
    for((i=0;i<5;i++)); do
        touch "archivo$i.txt"
    done
}


# 14. Renombrando Archivos: un script que renombre solo archivos de un directorio pasado
# como parametro agregandole una CADENA, contemplando las opciones:
# “-a CADENA”: renombra el fichero concatenando CADENA al final del nombre del archivo
# “-b CADENA”: renombra el fichero concantenado CADENA al principio del nombre del archivo
if [ $# -ne 3 ]
then
	echo "La Cantidad de parametros es incorrecta"
	exit 1
fi
if [ ! -d $1 ]
then
	echo "El primer parametro no es un directorio existente"
	exit 2
fi
if [ -z $3 ]
then
	echo "El tercer parametro es nulo"
	exit 3
fi

case $2 in
	"-a")
		for i in $(ls "$1"); do
			mv $1/$i $1/$i$3
		done
		;;
	"-b")
		for i in $(ls "$1"); do
			mv $1/$i $1/$3$i
		done
		;;
	*)
		echo "El segundo parametro debe ser -a o -b"
		exit 4
esac
