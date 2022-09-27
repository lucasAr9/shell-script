#!/bin/bash

# Recibe 2 argumentos y devuelve:
# 1 si el primero es el mayoR
# 0 en caso contrario

mayor() {
    echo "Se van a comparar los valores $*"
    if [ "$1" -gt "$2" ]; then
        echo "$1 es el mayor"
        return 1
    fi
    echo "$2 es el mayor"
    return 0
}

if [ $# -eq 2 ]; then    
    mayor "$1" "$2" # Invocación
    exit 0
else
    echo " todo mal"
    exit 1
fi
