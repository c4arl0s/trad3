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
            echo "${PINK}"
            echo -e "adding word: ${WHITE}$ENGLISH ..."
            createEnglishFile $ENGLISH
            transferEnglishTranslation
            createSpanishFile $SPANISH
            transferSpanishTranslation
        else
            exit 0
    fi
}
