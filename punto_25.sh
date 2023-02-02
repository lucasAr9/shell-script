#!/bin/bash


# Realice un script que agregue en un arreglo todos los nombres de los usuarios del sistema
# pertenecientes al grupo "users". Adicionalmente el script puede recibir como parametros:
# "-b n": Retorna el elemento de la posición n del arreglo si el mismo existe.
# Caso contrario, un mensaje de error.
# "-l": Devuelve la longitud del arreglo.
# "-i": Imprime todos los elementos del arreglo en pantalla.


usuarios=( $(cat /etc/group | grep users | cut -d":" -f4 | tr "," " ") )


case $1 in
    "-b") 
        pos=$(($2 - 1))
        if [ $pos -lt ${#usuarios[*]} ] && [ $pos -gt -1 ]; then
            echo "El usuario en la posicion $2 es: ${usuarios[pos]}"
        else
            echo "No hay usuario en la posicion $2"
        fi
    ;;
    "-l")
        echo "Cantidad de usuarios en users es: ${#usuarios[*]}"
    ;;
    "-i")
        echo "Todos los usuarios son:"
        for item in ${usuarios[*]}; do
            echo "$item"
        done
    ;;
esac


exit 0
