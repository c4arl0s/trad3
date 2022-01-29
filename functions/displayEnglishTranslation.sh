#!/bin/bash

displayEnglishTranslation()
{
    WORD=$1
    ROWS=`cuenta-lineas-archivo-ingles $palabra`
    echo -e "$BLANCO Existen $n significados de la palabra $WORD"
    for ROW in `seq $ROWS`	
    do
        obtener-campos-ingles $WORD $ROW
        imprimir-campos-ingles
    done
}

