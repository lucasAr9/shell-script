#!/bin/bash


# (a) Realizar un script que le solicite al usuario 2 números, los lea de la entrada
# Standard e imprima la multiplicación, suma, resta y cual es el mayor de los números leídos.
# (b) Modificar el script creado en el inciso anterior para que los números sean recibidos
# como parámetros. El script debe controlar que los dos parámetros sean enviados.
con_read() {
    if [ "$1" -gt "$2" ]; then
        mayor=$1
    else
        mayor=$2
    fi
    echo "El numero mayor es: $mayor"

    echo "$1 * $2 = " $(($1 * $2))
    echo "$1 + $2 = " $(($1 + $2))
    echo "$1 - $2 = " $(($1 - $2))
}


# (c) Realizar una calculadora que ejecute las 4 operaciones básicas: +, - ,*, %. Esta calcu-
# ladora debe funcionar recibiendo la operación y los números como parámetros
calculadora() {
    case "$2" in
        "+")
            echo $(($1 + $3));;
        "-")
            echo $(($1 - $3));;
        "*")
            echo $(($1 * $3));;
        "/")
            echo $(($1 / $3));;
        *)
            echo "incorrecto"
    esac
}


if [ "$#" -eq 0 ]; then
    read -rp "Ingrese el primer numero: " num1
    read -rp "Ingrese el primer numero: " num2
    con_read "$num1" "$num2"
elif [ "$#" -eq 2 ]; then
    con_read "$1" "$2"
elif [ "$#" -eq 3 ]; then
    resultado=$(calculadora "$1" "$2" "$3")
    echo "$1 $2 $3 es $resultado" 
else
    echo "Parametros incorrectos."
fi
