#!/bin/bash
# Instalar Veracrypt

# Descargar de la pagina de Veracrypt el .tar.bz2
# Descomprimirlo y verificar que se encuentra el archivo de console-x64
sudo ./veracrypt-1.26.24-setup-console-x64
# Va a pasar a una parte interactiva para haceptar la licencia
sudo apt update
sudo apt install libfuse2
veracrypt --version
