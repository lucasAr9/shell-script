#!/bin/bash


# (b) Crear un script que muestre 3 opciones al usuario: Listar, DondeEstoy y QuienEsta.
# Según la opción elegida se le debe mostrar:
# Listar: lista el contenido del directoria actual.
# DondeEstoy: muestra el directorio donde me encuentro ubicado.
# QuienEsta: muestra los usuarios conectados al sistema.

echo "Opciones"
echo "a. Listar"
echo "b. Donde estoy"
echo "c. Quien esta"
read -r opcion

case $opcion in
    "a")
        ls -la;;
    "b")
        pwd;;
    "c")
        who;;
    *)
        echo "opcion incorrecta"
esac
