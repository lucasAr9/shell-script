#!/bin/bash


# 16. Realizar un script que reciba como parámetro una extensión y haga un reporte con 2
# columnas, el nombre de usuario y la cantidad de archivos que posee con esa extensión. Se
# debe guardar el resultado en un archivo llamado reporte.txt.


# con un solo usuario
if [ $# -ne 1 ]; then
    echo "El script necesita recibir una extencion de archvo como parametro."
    exit 1
fi

usuario=$(whoami)
extencion=".$1"
cant="$(find "$HOME"/Documentos -name "*.$1" | wc -l)"

echo "$usuario    $cant    $extencion" >> reporte.txt


# con todos los usuarios
