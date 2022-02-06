#!/bin/bash

isRetrievableEnglishWord()
{
    englishWord=$1
    test -f $directorio_ingles/$englishWord.txt   #prueba si el archivo existe
}

