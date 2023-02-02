#!/bin/bash

# 22. Dada la siguiente declaración al comienzo de un script: num=(10 3 5 7 9 3 5 4)
# (la cantidad de elementos del arreglo puede variar). Implemente la función producto
# dentro de este script, cuya tarea sea multiplicar todos los números del arreglo.

producto() {
    result=1
    for item in "${num[@]}";do
        result=$(("$result" * "$item"))
    done
    echo $result
}

if [ $# -ne 0 ]; then
    echo "el script no admite parametros."
    exit 1
fi

num=(10 3 5 7 9 3 5 4)
result=$(producto num)
echo "el resultado es $result"
exit 0