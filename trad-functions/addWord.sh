#!/usr/bin/env bash

addWord()
{
    TRANSLATION=$1
    ENGLISH=$2
    getTranslation $TRANSLATION $ENGLISH
    printAddedTranslation 
    printf "%s" "is this correct? (tap ENTER) : "; read -r CONFIRMATION
    # if [ "$confirmacion" = "" ]
    if [ -z "$CONFIRMATION" ]
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
