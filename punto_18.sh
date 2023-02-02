#!/bin/bash

# 18. Crear un script que verifique cada 10 segundos si un usuario se ha logueado en el sistema
# (el nombre del usuario será pasado por parámetro). Cuando el usuario finalmente se loguee,
# el programa deberá mostrar el mensaje ”Usuario XXX logueado en el sistema” y salir.

while true; do
    sleep 10s
    
    usuario=$(who | cut -d" " -f1)

    if [ "$usuario" == "$1" ]; then
        echo "El usuario $1 se conecto."
        break
    fi
done
