#!/usr/bin/env bash

displayEnglishTranslation()
{
    # echo "Displaying English Translation"
    WORD=$1
    ROWS=$(cuenta-lineas-archivo-ingles $WORD)
    # echo "ROWS value is: $ROWS"
    # echo -e "$ROWS meanings of $ROJO $WORD"
    for ROW in `seq $ROWS`
    do  
        getEnglishFields $WORD $ROW
        imprimir-campos-ingles
    done
}
