#!/usr/bin/env bash

. $HOME/iOS-Projects/DictEnEsScript/directoryPaths.sh

LAST_WORD_FOUND=

while [ -z "$*" ]
do
    printTitle $(basename $0)
    echo -n "${CYAN}"
    read WORD
    if $(isRetrievableEnglishWord $WORD)
    then
        printf "\n${GREEN}$WORD is available in english data base"
        reproduceEnglishAudioFileIfAvailable $WORD
        displayEnglishTranslation $WORD
        LAST_WORD_FOUND=$WORD
    elif [ -z "$WORD" ]
    then
        echo "${RED}Empty word"        
        reproduceLastWordFoundIfAvailable $LAST_WORD_FOUND
    else
        printf "\n${RED}$WORD does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            printf "\n${GREEN}$WORD ${RED}does exist on spanish data base"
            SPANISH_WORD=$WORD
            cleanSpanishFile $SPANISH_WORD
            displaySpanishTranslation $SPANISH_WORD
            cleanEnglishWord=$(echo "${INGLES}" | xargs)
            reproduceEnglishAudioFileIfAvailable $cleanEnglishWord
            LAST_WORD_FOUND=$cleanEnglishWord
        else
            printf("\n${}It seems that we can find it using google script")
            searchWordUsingGoogleScript $WORD
            reproduceEnglishAudioFileIfAvailable $ingles 
            displayOptionToAddNewWord
            read decision
            displayMenu
            LAST_WORD_FOUND=$ingles
        fi
    fi
done
