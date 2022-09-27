#!/bin/bash

echo "Hola arreglo, bienvenido."
# arreglo=() # Se crea vacı́o
myArray=(1 2 3 5 8 13 21 {a..g}) # Inicializado

echo "---> Imprimir los arreglos sin for"
echo "${myArray[*]}"
echo "o tambien con"
echo "${myArray[@]}"

echo "
---> Un echo normal con una posicion del arreglo"
echo "${myArray[2]}"

echo "
---> Imprimir el arreglo con un forEach"
for item in "${myArray[@]}"; do
    echo "$item"
done

echo "
---> Asignar un nuevo valor al arreglo en la posicion 2"
myArray[2]="otroNumero"
echo "${myArray[*]}"

echo "
---> Eliminar un elemento del arreglo en la posicion 1"
unset "myArray[1]"
echo "${myArray[*]}"

echo "
---> Tamaño del arreglo"
echo "${#myArray[*]}"
echo "o tambien con"
echo "${#myArray[@]}"
