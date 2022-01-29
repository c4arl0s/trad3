#!/bin/bash

limpiar-archivo-ingles()
{
palabra=$1
# sed '/^ *$/d' file
# Borra todas las lineas que esten vacias o que contengan espacios en blanco.
#  '*' Indica 0 o mas ocurrencias del caracter previo. 
#  '^ *$' Indica una linea que contiene cero o mas espacios. 
# Por lo tanto, esto borrara todas las lineas las cuales estan vacias o lineas con solo algunos espacios en blanco.
sed '/^ *$/d' $directorio_ingles/$palabra.txt > $directorio_comodin/comodin.txt
cat $directorio_comodin/comodin.txt > $directorio_ingles/$palabra.txt
}

