#!/bin/bash

# Encriptar un archivo. Le pone extencion .gpg
gpg -c nombre_archivo.pdf

# Desencriptar un archivo. Hay que especificar nombre de los archivos.
# -o el nombre del nuevo archivo desencriptado; -d el nombre del archivo .gpg
gpg -o nombre_archivo.pdf -d nombre_archivo.pdf.gpg

# Despues de encriptar hay que borrar el archivo original.
