#!/bin/bash

isRetrievableEnglishWord()
{
    WORD=$1
    test -f $ENGLISH_DIRECTORY_PATH/$WORD.txt   #prueba si el archivo existe
}

