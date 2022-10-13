#!/bin/bash

# 20. Realice un script que simule el comportamiento de una estructura de PILA e implemente
# las siguientes funciones aplicables sobre una estructura global definida en el script:
# push: Recibe un parámetro y lo agrega en la pila
# length: Devuelve la longitud de la pila
# pop: Saca un elemento de la pila
# print: Imprime todos elementos de la pila

push() {
    pila+=("$1")
    echo "Elemento agragado."
}


length() {
    echo "Longitud de la pila: ${#pila[@]}"
}


pop() {
    echo "Pop: ${pila[${#pila[@]}- 1]}"
    unset pila[-1]
}


print() {
    echo "Todo el arreglo: "
    echo "${pila[*]}"
}


pila=()

push 2
push 3
push 9

length

print

push 10

pop

print
