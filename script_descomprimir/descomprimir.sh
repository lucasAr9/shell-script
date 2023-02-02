#!/bin/bash

# $1 = directorio o archivo a descomprimir
# $2 = directorio de destino de los archivos descomprimidos (opcional)
# Descomprimir todos los .zip del directorio pasado por parametro.
if [ $# -lt 1 ]; then
    echo "El script debe recibir al menos un directorio como parametro."
    exit 2
fi
if [ $# -gt 2 ]; then
    echo "El script solo acepta dos parametros como maximo."
    exit 3
fi

fecha_ejecucion=$(date +"%Y%m%d_%H%M%S")
log2="$fecha_ejecucion"_control.log

echo "fecha y hora de ejecucion: " $fecha_ejecucion
echo " "
echo "fecha y hora de ejecucion: " $fecha_ejecucion                        >> $log2
echo " "                                                                   >> $log2

pathBuscar=$1

if [ $# -eq 2 ]; then
    if [ -d $2 ]; then
        pathDescomprimir=$2
    else
        echo "No se encontro el directorio $2, para guardar los archivos." >> $log2
        exit 4
    fi
else
    pathDescomprimir=$1
fi

procesados=0

if [ -f $pathBuscar ]; then
    procesados=1
    imprimir=$pathBuscar
    if [ $# -eq 1 ]; then
        path=$(readlink -e $1)
        pathDescomprimir=$(dirname $path)
    fi
    unzip -joq $pathBuscar -d $pathDescomprimir                         2>> $log2
fi

if [ -d $pathBuscar ]; then
    procesados=$(ls $pathBuscar | grep -c .zip)
    imprimir=$(find "$pathBuscar"*.zip)
    find "$pathBuscar"*.zip -exec unzip -joq {} -d $pathDescomprimir \; 2>> $log2
fi

echo $imprimir

if [ $procesados = 0 ]; then
    echo "NO se encontraron archivos .zip en la ruta $pathBuscar"
    echo "NO se encontraron archivos .zip en la ruta $pathBuscar"                     >> $log2
    exit 1
else
    echo "$imprimir"
    echo " "
    echo "Se procesaron ($procesados) archivos .zip"
    echo "Se descomprimio del directorio '$pathBuscar' al directorio '$pathDescomprimir'"
    echo "$imprimir"                                                                      >> $log2
    echo " "                                                                              >> $log2
    echo "Se procesaron ($procesados) archivos .zip"                                      >> $log2
    echo "Se descomprimio del directorio '$pathBuscar' al directorio '$pathDescomprimir'" >> $log2
    exit 0
fi

# codigo 1   -> No se encontro ningun archivo .zip
# codigo 2   -> El script no recibio ningun parametro.
# codigo 3   -> El script recibio mas de dos parametros.
# codigo 4   -> No se encontro el directorio de destino de los archivos.