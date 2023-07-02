#!/usr/bin/env bash

addWord()
{
    TRANSLATION=$1
    ENGLISH=$2
    getTranslation $TRANSLATION $ENGLISH
    printAddedTranslation 
    echo -e "is this correct? (tap ENTER) : "
    echo -e ""
    read -r confirmacion 
    if [ "$confirmacion" = "" ]
        then
            echo "$ROSA"
            echo -e "adding word:$BLANCO $ENGLISH ..."
            createEnglishFile $ENGLISH
            transferEnglishTranslation
            createSpanishFile $SPANISH
            transferSpanishTranslation
        else
            exit 0
    fi
}
