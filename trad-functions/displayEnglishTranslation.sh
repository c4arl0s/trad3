#!/bin/bash

displayEnglishTranslation()
{
    WORD=$1
    ROWS=$(cuenta-lineas-archivo-ingles $WORD)
    echo "ROWS IS $ROWS"
    echo -e "$BLANCO Exist $ROWS meanings of $ROJO $WORD"
    for ROW in `seq $ROWS`
    do  
        getEnglishFields $WORD $ROW
        imprimir-campos-ingles
    done
}
