#!/bin/bash

# 17. Escribir un script que al ejecutarse imprima en pantalla los nombre de los archivos que se
# encuentran en el directorio actual, intercambiando minúsculas por mayúsculas, además de
# eliminar la letra a (mayúscula o minúscula). Ejemplo, directorio actual.

ls | tr -d 'aA' | tr '[:lower:]' '[:upper:]'