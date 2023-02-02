#!/bin/bash

# 19. Escribir un Programa de “Menu de Comandos Amigable con el Usuario” llamado menu, el
# cual, al ser invocado, mostrará un menú con la selección para cada uno de los scripts creados
# en esta práctica. Las instrucciones de como proceder deben mostrarse junto con el menú.
# El menú deberá iniciarse y permanecer activo hasta que se seleccione Salir.


menu() {
    echo "1. ejercicio 13 a"
    echo "2. ejercicio 13 b"
    echo "3. ejercicio 13 c"
    echo "Ingrese la opcion a ejecutar: "
}


until [ "$opcion" -eq 0 ]; do
    menu

    read -r opcion

    case "$opcion" in
        1)
            bash punto_13_a.sh
        ;;
        2)
            bash punto_13_b.sh
        ;;
        3)
            bash punto_13_c.sh
        ;;
        0)
            break
        ;;
        *)
            echo "Opcion incorrecta."
        ;;
    esac
done
