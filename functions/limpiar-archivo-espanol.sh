#!/bin/bash

limpiar-archivo-espanol()
{
    WORD=$1
    #borrar lineas vacias
    sed '/^ *$/d' $SPANISH_DIRECTORY_PATH/$WORD.txt > $COMODIN_DIRECTORY_PATH/comodin.txt
    cat $COMODIN_DIRECTORY_PATH/comodin.txt > $SPANISH_DIRECTORY_PATH/$WORD.txt
}
