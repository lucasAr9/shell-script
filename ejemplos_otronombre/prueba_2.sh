#!/bin/bash

i=0
while true
do
    i=$((i + 1))
    # let i++
    # (( i++ ))

    if [ "$i" -eq 6 ]; then
        break # Corta el while
    elif [ "$i" -eq 3 ]; then
        continue # Salta una iteración
    fi
    echo "$i"
done

