#!/bin/bash

# Hay que instalar la utilidad ecryptfs.
sudo apt install ecryptfs-utils cryptsetup

# Para poder encriptar el home de un usuario, hay
# que hacerlo desde otro usuario con permisos de admin.
sudo ecryptfs-migrate-home -u <nombre_de_usuario>
# Tambien encriptar el swap.
sudo ecryptfs-setup-swap

# Se crea un directorio de respaldo, hay que borrarlo.
# xxxxxxxx son numeros o letras aleatorios.
sudo rm -rf /home/<nombre_de_usuario>.xxxxxxxx

# Por ultimo, queda el usuario "principal" y un directorio ".ecryptfs".
# Los dos son necesarios para que funcione y se encripta y desencripta
# automaticamente con la contraseña del usuario "principal".