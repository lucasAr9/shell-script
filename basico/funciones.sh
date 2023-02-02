#!/bin/bash


funcion_suma() {
    local resultado=$(($1 + $2))
    echo "$resultado"
}


echo "
---> Suma de dos numeros."
read -rp "numero 1: " num1
read -rp "numero 2: " num2

resul=$(funcion_suma "$num1" "$num2")
echo "Resultado: $resul"
