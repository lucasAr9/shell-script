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
        echo "La funcion debe recibir al menos un elemento a agregar."
        return 2
    fi
    arreglo=($*)
    return 0
}


eliminar () {
    if [ $# -eq 0 ]; then
        echo "La funcion debe recibir al menos una posicion para eliminar."
        return 3
    fi
    
    for pos in $*; do
        if [ $pos -gt ${arreglo[*]} ]; then
            echo "La posicion $pos no esta dentro del rango del arreglo, operacion rechazada."
            return 31
        fi
    done

    for pos in $*; do unset arreglo[$pos]; done

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
    # Parametro 2 = elemento a agregar en todas las posiciones. (opcional)
    # Si no recibe el parametro 2 agrega elementos random.
    if [ $# -eq 0 ]; then
        echo "La funcion no admite parametros."
        return 6
    fi

    return 0
    
}


finalizar_programa () {
    exit 0
}


while true; do
    echo "------------------------opciones------------------------"
    
    select opcion in inicializar agregar eliminar longitud imprimir finalizar_programa; do
        case $opcion in
            inicializar)
                inicializar
            ;;
            agregar)
                agregar
            ;;
            eliminar)
                eliminar
            ;;
            longitud)
                longitud
            ;;
            imprimir)
                imprimir
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

