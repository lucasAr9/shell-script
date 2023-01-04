#!/bin/bash
# Descomprimir todos los .zip del directorio pasado por parametro.

# codigo 1   -> No se encontro ningun archivo .zip
# codigo 2   -> No se encontro el directorio.
# codigo 3   -> El script no recibio ningun parametro.
# codigo 4   -> El script recibio mas de dos parametros.

if [ $# -lt 1 ]; then
    echo "El script debe recibir al menos un directorio como parametro."
    exit 3
fi
if [ $# -gt 2 ]; then
    echo "El script solo acepta dos parametros como maximo."
    exit 4
fi

fecha_ejecucion=$(date +"%Y%m%d_%H%M%S")
log2="$fecha_ejecucion"_control.log

echo "fecha y hora de ejecucion: " $fecha_ejecucion              >> $log2
echo " "                                                         >> $log2

pathBuscar=$1

if [ $# -eq 2 ]; then
    pathDescomprimir=$2
else
    pathDescomprimir=$1
fi

procesados=0

if [ -d $pathBuscar ]; then
    procesados=$(ls $pathBuscar | grep -c .zip)
    find "$pathBuscar"*.zip -exec unzip -joq {} -d $pathDescomprimir \; 2>> $log2
else
    echo "No se encontro el directorio $pathBuscar, para procesar."     >> $log2
    exit 2
fi

if [ $procesados = 0 ]; then
    echo "NO se encontraron archivos .zip del directorio $pathBuscar"   >> $log2
    exit 1
else
    echo "Se procesaron ($procesados) archivos .zip"                                  >> $log2
    echo "Se descomprimio del directorio $pathBuscar al directorio $pathDescomprimir" >> $log2
    exit 0
fi

# que envie al output y al log los archivos que proceso.
# que si lo enviado por parametro es un zip, que descomprima eso solo.
