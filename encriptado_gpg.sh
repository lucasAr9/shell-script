#!/bin/bash

# Si lo que se quiere es encriptar carpetas, primero hay que zipear.
zip -r documentos.zip documentos # comprimir
unzip documentos.zip # descomprimir

# Encriptar un archivo. Le pone extencion .gpg
gpg -c nombre_archivo.pdf

# Desencriptar un archivo. Hay que especificar nombre de los archivos.
# -o el nombre del nuevo archivo desencriptado; -d el nombre del archivo .gpg
gpg -o nombre_archivo.pdf -d nombre_archivo.pdf.gpg

# Despues de encriptar hay que borrar el archivo original.
