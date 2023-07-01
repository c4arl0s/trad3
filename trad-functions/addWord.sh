#!/usr/bin/env bash

addWord()
{
    traduccion=$1
    ingles=$2
    getTranslation $traduccion $ingles
    printAddedTranslation 
    echo -e "is this correct? (tap ENTER) : "
    echo -e ""
    read -r confirmacion 
    if [ "$confirmacion" = "" ]
        then
            echo "$ROSA"
            echo -e "adding word:$BLANCO $ingles ..."
            crear_archivo_ingles
            transferEnglishTranslation
            crear-archivo-espanol
            transferSpanishTranslation
        else
            exit 0
    fi
}
