#!/bin/bash


# variables de prueba
numA=3
numB=2

# operaciones aritmeticas basicas de bash
echo "
---> operaciones aritmeticas <---"
result=$((numA + numB))
echo "$numA + $numB = $result"

result=$((numA - numB))
echo "$numA - $numB = $result"

result=$((numA * numB))
echo "$numA * $numB = $result"

result=$((numA / numB))
echo "$numA / $numB = $result"


# operaciones relacionales basicos en bash
echo "
---> operaciones relacionales <---"
echo "0 = false; 1 = true"
echo "$numA > $numB = " $((numA > numB))
echo "$numA < $numB = " $((numA < numB))
echo "$numA >= $numB = " $((numA >= numB))
echo "$numA >= $numB = " $((numA >= numB))
echo "$numA == $numB = " $((numA == numB))
echo "$numA != $numB = " $((numA != numB))
