#!/usr/bin/env bash

isRetrievableSpanishWord()
{
    WORD=$1
    test -f $SPANISH_DIRECTORY_PATH/$WORD.txt	#prueba si el archivo existe
}
