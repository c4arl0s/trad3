#!/bin/bash

limpiar-archivo-espanol()
{
palabra=$1
#borrar lineas vacias
sed '/^ *$/d' $directorio_espanol/$palabra.txt > $directorio_comodin/comodin.txt
cat $directorio_comodin/comodin.txt > $directorio_espanol/$palabra.txt
}
