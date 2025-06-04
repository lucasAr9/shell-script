#!/bin/bash
if [ "$#" -ne 0 ]; then
    echo "El script no puede recibir parametros"
    exit 1
fi


buscar_archivos_en_directorio() {
    # Buscar archivos .vc en el directorio actual de ejecucion del script y le asigna un numero.
    # Deja marcar una opcion numerica segun el archivo que corresponda en ese numero y lo retorna en la funcion.
    # O sino, deja ingresar manualmente el nombre del archivo y lo retorna.

    while true; do
        # Verificar si hay archivos .vc
        vc_files=$(ls *.vc 2>/dev/null)
        if [[ -z "$vc_files" ]]; then
            echo ">>> No se encontraron archivos .vc en el directorio actual."
        else
            echo ">>> Archivos .vc encontrados:"
            i=1
            archivos=()
            while IFS= read -r archivo; do
                archivos+=("$archivo")
                echo ">>> $i. $archivo"
                ((i++))
            done <<< "$vc_files"
        fi
        echo ">>> 0. Ingresar nombre de archivo manualmente"
        read -p ">>> Elegi una opcion: " opcion
        echo

        # Opcion manual
        if [[ "$opcion" == "0" ]]; then
            read -p ">>> Ingresa el nombre del archivo (inclui ruta absoluta y .vc): " manual
            echo
            VOLUME_NAME="$manual"
            return 0
        fi
        # Validar opcion numerica
        if [[ "$opcion" =~ ^[0-9]+$ ]] && [ "$opcion" -ge 1 ] && [ "$opcion" -le "${#archivos[@]}" ]; then
            archivo_elegido="${archivos[$((opcion-1))]}"
            VOLUME_NAME="$archivo_elegido"
            return 0
        else
            echo ">>> Opcion invalida. Intenta de nuevo."
        fi
    done
}


crear_volumen_nuevo() {
    # Crear un volumen nuevo.
    # Pregunta por la clave y el nombre del archivo .vc que va a tener el nuevo volumen encriptado.

    read -p ">>> Ingresa nombre de archivo (inclui .vc): " nombre
    echo
    VOLUME_NAME="$nombre"
    read -s -p ">>> Ingresa tu clave: " clave
    echo
    PASSWORD="$clave"
    SIZE="500M"

    # Crear volumen Veracrypt no interactivo
    veracrypt --text --create "$VOLUME_NAME" \
        --volume-type normal \
        --size "$SIZE" \
        --encryption AES \
        --hash SHA-512 \
        --filesystem FAT \
        --pim=0 \
        --keyfiles="" \
        --random-source=/dev/random \
        --password="$PASSWORD" \
        --non-interactive \
        --quick

    # Comprobar si la creación fue exitosa
    if [ $? -eq 0 ]; then
        echo ">>> Volumen creado correctamente en: [$PWD] con el nombre: [$VOLUME_NAME]"
        return 0
    else
        echo ">>> Error al crear el volumen."
        return 1
    fi
}


abrir_volumen_encriptado() {
    # Abrir un volumen existente.
    # Busca los archivos .vc que esten en el mismo directorio que el script.
    # Pregunta la clave para desencriptar el volumen de la opcion marcada

    buscar_archivos_en_directorio
    read -s -p ">>> Ingresa tu clave: " clave
    echo
    PASSWORD="$clave"
    MOUNT_POINT="mount_point"

    # Crear punto de montaje si no existe
    if [ ! -d "$MOUNT_POINT" ]; then
        mkdir -p "$MOUNT_POINT"
    fi

    # Montar el volumen con Veracrypt (no interactivo)
    veracrypt --text --mount "$VOLUME_NAME" "$MOUNT_POINT" \
        --password="$PASSWORD" \
        --non-interactive

    # Verificar si se monto correctamente
    if [ $? -eq 0 ]; then
        echo ">>> Volumen: [$VOLUME_NAME] montado correctamente en: [$MOUNT_POINT]"
        return 0
    else
        echo ">>> Error al montar el volumen."
        return 1
    fi
}


cerrar_volumenes_abiertos() {
    # Desmontar todos los volumenes abiertos con Veracrypt

    echo ">>> Volumenes encontrados para cerrar"
    veracrypt --text --list
    veracrypt --text --dismount --non-interactive
}


# -------------------------------------------------- MAIN --------------------------------------------------
echo "Programa para ejecutar veracrypt"
echo "ejecutando en: [$PWD]"
VOLUME_NAME=""  # Inicializar variable para el volumen a elegir
opcion=""       # Inicializar variable para la opcion a elegir
while [ "$opcion" != "0" ]; do
    # echo
    # echo "  **********************************"
    # echo "  1. Crear nuevo volumen encriptado."
    # echo "  2. Abrir un volumen encriptado."
    # echo "  3. Cerrar los volumenes abiertos."
    # echo "  0. Salir."
    # echo "  **********************************"
    # echo
    # read -p "Opcion: " opcion
    # echo

    # Colores ANSI
    ROJO='\033[0;31m'
    VERDE='\033[0;32m'
    AMARILLO='\033[1;33m'
    AZUL='\033[1;34m'
    NC='\033[0m' # Sin color
    # Mostrar menu con formato
    echo
    echo -e "${AZUL}  ==================================${NC}"
    echo -e "${AMARILLO}     GESTION DE VOLUMENES SEGUROS${NC}"
    echo -e "${AZUL}  ==================================${NC}"
    echo -e "${VERDE}  1.${NC} Crear nuevo volumen encriptado."
    echo -e "${VERDE}  2.${NC} Abrir un volumen encriptado."
    echo -e "${VERDE}  3.${NC} Cerrar los volúmenes abiertos."
    echo -e "${ROJO}  0.${NC} Salir."
    echo -e "${AZUL}  ==================================${NC}"
    echo
    read -p "Opcion: " opcion
    echo

    case $opcion in
        1)
            crear_volumen_nuevo
            ;;
        2)
            abrir_volumen_encriptado
            ;;
        3)
            cerrar_volumenes_abiertos
            ;;
        0)
            echo ">>> Saliendo del programa..."
            ;;
        *)
            echo ">>> Opcion no valida. Por favor, selecciona una opcion del 1 al 4."
            ;;
    esac
    sleep 2
    echo
done

exit 0
