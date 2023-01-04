#!/bin/bash

# $1 = token de acceso
# $2 = nombre de aplicacion
# $3 = id del merge request
# Ingresar a gitlab y generar un merge request
if [ $# -ne 3 ]; then
    echo "Parametros incorrectos."
    exit 1
fi

fecha_ejecucion=$(date +"%Y%m%d_%H%M%S")
echo "FECHA Y HORA DE EJECUCION: " $fecha_ejecucion
echo " "

respuesta=$(curl -v --request GET -H "PRIVATE-TOKEN: $1" -H "Accept: application/json, text/plain, /" -H "Content-Type: application/json" "http://gitserver.ggti.arba.gov.ar/api/v4/projects?search=$2")
echo $respuesta

echo $respuesta | grep -o '"message":"401 Unauthorized"'
if [ $? == 0 ]; then
    echo "El token es incorrecto"
    exit 2
else
    length=$(expr length "$respuesta")
    if [ $length == 2 ]; then
        echo "El nombre del repositorio es incorrecto."
        exit 3
    else
        id=$(echo $respuesta | cut -d":" -f2 | cut -d"," -f1)
    fi
fi

codigo=$(curl -v --location --request PUT -H "PRIVATE-TOKEN: $1" -H "Accept: application/json, text/plain, /" -H "Content-Type: application/json" "http://gitserver.ggti.arba.gov.ar/api/v4/projects/$id/merge_requests/$3/merge")

echo $codigo | grep -o '"state":"merged"'
if [ $? == 0 ]; then
    echo "todo ok"
    exit 0
else
    echo "El id del merge es incorrecto"
    exit 4
fi

# exit 1
# Parametros incorrectos.

# exit 2
# {"message":"401 Unauthorized"}
# Significa que el token esta mal o vencio.

# exit 3
# {"message": "404" proyect not found}
# Significa que el proyecto no se encontro.

# exit 4
# {"message":"405 Method Not Allowed"}
# Significa que el id del merge request esta mal o no existe.

# codigo 422
# {"message":"422 Branch cannot be merged"}
# Significa que no se pudo mergear.
