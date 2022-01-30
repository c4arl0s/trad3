#!/bin/bash

# sed '/^ *$/d' file
# Borra todas las lineas que esten vacias o que contengan espacios en blanco.
#  '*' Indica 0 o mas ocurrencias del caracter previo. 
#  '^ *$' Indica una linea que contiene cero o mas espacios. 
# Por lo tanto, esto borrara todas las lineas las cuales estan vacias o lineas con solo algunos espacios en blanco.

formatEnglishFile()
{
    WORD=$1
    sed '/^ *$/d' $ENGLISHDIRECTORY_PATH/$WORD.txt #> $COMODINDIRECTORY_PATH/comodin.txt
    cat $COMODINDIRECTORY_PATH/comodin.txt > $ENGLISHDIRECTORY_PATH/$WORD.txt
}

