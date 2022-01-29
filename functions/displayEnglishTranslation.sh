#!/bin/bash

displayEnglishTranslation()
{
    WORD=$1
    ROWS=`cuenta-lineas-archivo-ingles $palabra`
    echo -e "$BLANCO Exist $ROWS meanings of $ROJO $WORD"
    for ROW in `seq $ROWS`
    do  
        echo "$ROW"
        getEnglishFields $WORD $ROW
        imprimir-campos-ingles
    done
}

