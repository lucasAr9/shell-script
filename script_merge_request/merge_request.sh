#!/bin/bash

# $1 = token de acceso
# $2 = nombre de aplicacion
# $3 = id del merge request
# Ingresar a gitlab y generar un merge request
if [ $# -ne 3 ]; then
    echo "El script debe recibir como parametro:"
    echo "El parametro 1 es el token de acceso."
    echo "El parametro 2 es el ID de la aplicacion."
    echo "El parametro 3 es el ID del merge request."
    exit 1
fi

fecha_ejecucion=$(date +"%Y%m%d_%H%M%S")
echo "FECHA Y HORA DE EJECUCION: " $fecha_ejecucion
echo " "

id=$(curl -v --location --request GET -H "PRIVATE-TOKEN: $1" -H "Accept: application/json, text/plain, /" -H "Content-Type: application/json" "http://gitserver.ggti.arba.gov.ar/api/v4/projects?search=$2" | cut -d":" -f2 | cut -d"," -f1)

codigo=$(curl -v --location --request PUT -H "PRIVATE-TOKEN: $1" -H "Accept: application/json, text/plain, /" -H "Content-Type: application/json" "http://gitserver.ggti.arba.gov.ar/api/v4/projects/$id/merge_requests/$3/merge")
echo $codigo

# El mensaje
# {"message":"401 Unauthorized"}
# Significa que el token esta mal o vencio.

# El mensaje
# {"message": "404" proyect not found}
# Significa que el proyecto no se encontro.

# El mensaje
# {"message":"405 Method Not Allowed"}
# Significa que el id del merge request esta mal o no existe.

# El mensaje
# {"message":"422 Branch cannot be merged"}
# Significa que no se pudo mergear.
