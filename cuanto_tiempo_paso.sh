#!/bin/bash

fecha_desde="2025-05-27"
fecha_actual=$(date +"%Y-%m-%d")

# Validar formato y existencia de la fecha
if ! date -d "$fecha_desde" +%s >/dev/null 2>&1; then
    echo "Error: la fecha '$fecha_desde' no es válida."
    exit 1
fi

timestamp_desde=$(date -d "$fecha_desde" +%s)
timestamp_actual=$(date -d "$fecha_actual" +%s)

# Calcular la diferencia en segundos entre las dos fechas
diferencia_segundos=$((timestamp_actual - timestamp_desde))

# Convertir la diferencia de segundos a días (86400 segundos en un día)
diferencia_dias=$((diferencia_segundos / 86400))

if [ 0 -le $diferencia_dias ]; then
    echo "Paso [$diferencia_dias] días desde ($fecha_desde) hasta hoy ($fecha_actual)"
else
    echo "Faltan [$((diferencia_dias * -1))] días para el día ($fecha_desde) desde hoy ($fecha_actual)"
fi
