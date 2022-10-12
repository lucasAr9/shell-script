#!/bin/bash

# Un script que implemente a través de la utilización de funciones las operaciones básicas sobre arreglos:


inicializar () {
    if [ $# -ne 0 ]; then
        echo "La funcion no admite parametros."
        return 1
    fi
    arreglo=()
    return 0
}


agregar () {
    if [ $# -eq 0 ]; then
        echo "La funcion debe recibir un elemento a agregar."
        return 2
    fi
    arreglo+=($1)
    return 0
}


eliminar () {
    if [ $# -eq 0 ]; then
        echo "La funcion debe recibir una posicion para eliminar."
        return 3
    fi
    
    if [ $1 -ge ${#arreglo[*]} ]; then
        echo "La posicion $1 no esta dentro del rango del arreglo, operacion rechazada."
        return 31
    fi

    unset arreglo[$1]

    arreglo=(${arreglo[*]})

    return 0
}


longitud () {
    if [ $# -ne 0 ]; then
        echo "La funcion no admite parametros."
        return 4
    fi
    echo "Longitud arreglo: ${#arreglo[*]}"
    return 0
}


imprimir () {
    if [ $# -ne 0 ]; then
        echo "La funcion no admite parametros."
        return 5
    fi
    echo "${arreglo[*]}"
    return 0
}


iniciar_con_valores () {
    # Parametro 1 = longitud del arreglo.
    # Parametro 2 = elemento a agregar en todas las posiciones.
    if [ $# -eq 0 ]; then
        echo "La funcion debe recibir la longitud del arreglo y elemento a agregar."
        return 6
    fi

    arreglo=()

    for ((i=0; i<$1; i++)); do
        arreglo+=($2)
    done

    return 0
}


finalizar_programa () {
    exit 0
}


while true; do
    echo "------------------------opciones------------------------"
    
    select opcion in inicializar agregar eliminar longitud imprimir iniciar_con_valores finalizar_programa; do
        case $opcion in
            inicializar)
                inicializar
            ;;
            agregar)
                echo "elemento a agregar:"
                read num
                agregar $num
            ;;
            eliminar)
                echo "posicion a eliminar:"
                read num
                eliminar $num
            ;;
            longitud)
                longitud
            ;;
            imprimir)
                imprimir
            ;;
            iniciar_con_valores)
                echo "longitud del arreglo:"
                read longitud
                echo "elemento a agregar:"
                read num
                iniciar_con_valores $longitud $num
            ;;
            finalizar_programa)
                finalizar_programa
            ;;
            *)
                echo "Opcion incorrecta"
            ;;
        esac
    done
done

