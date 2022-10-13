#!/bin/bash

# 23. Implemente un script que recorra un arreglo compuesto por números e imprima en pantalla
# sólo los números pares y que cuente sólo los números impares y los informe en pantalla al
# finalizar el recorrido.

if [ $# -ne 0 ]; then
    exit 1
fi

arreglo=(1 2 3 4 5 6 7 8 9)

impares=0
for item in "${arreglo[@]}"; do
    if [ $(($item % 2)) -eq 0 ]; then
        echo "$item"
    else
        impares=$((impares + 1))
    fi
done
echo "la cantidad de impares es: $impares"

exit 0
