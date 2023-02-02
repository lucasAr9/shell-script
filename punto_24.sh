#!/bin/bash

if [ $# -ne 0 ]; then
    exit 1
fi

vector1=(1 80 65 35 2)
vector2=(5 98 3 41 8 9 8 9)

if [ ${#vector1[*]} -ge ${#vector2[*]} ]; then
    longitud=${#vector1[*]}
else
    longitud=${#vector2[*]}
fi

for ((i=0;i<longitud;i++)); do
    echo "La suma de los elementos de la posición $i es: $((${vector1[$i]} + ${vector2[$i]}))"
done

exit 0
