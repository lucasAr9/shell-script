#!/bin/bash


nombre=""
edad=0

read -rp "Ingresa tu nombre: " nombre
read -rp "Ingresa tu edad: " edad

echo "Hola $nombre con la edad $edad"

if [ "$edad" -ge 18 ]; then
    echo "Sos mayor de edad"
else
    echo "No eres mayor de edad"
fi
