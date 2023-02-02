#!/bin/bash

echo "
---> el comando con \$()"
variable=$(ls -lha /home/luk/Documentos)
echo "$variable"

echo "
---> el comando con \`\`"
variable_2=`ls -lha /home/luk/Documentos`
echo "$variable_2"

echo "
---> imprimir los directorios con un for"
variable_3=$(ls /home/luk/Documentos)
for archivo in ${variable_3}; do
    echo "$archivo"
done

