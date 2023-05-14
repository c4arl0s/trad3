#!/usr/bin/env bash

. $HOME/iOS-Projects/DictEnEsScript/directoryPaths.sh

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

    elif [ -z "$WORD" ]
    then
        echo "${RED}Empty word"        
        LAST_WORD_FOUND=$(echo $INGLES | cut -d ":" -f 1 | tr -d "[:space:]")
        reproduceLastWordFoundIfAvailable $LAST_WORD_FOUND

    else
        printf "\n${RED}$WORD does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            printf "\n${GREEN}$WORD ${RED}does exist on spanish data base"
            SPANISH_WORD=$WORD
            cleanSpanishFile $SPANISH_WORD
            displaySpanishTranslation $SPANISH_WORD
            reproduceEnglishAudioFileIfAvailable  $ingles
        else
            searchWordUsingGoogleScript $WORD
            if $(isRetrievableEnglishAudio $ingles)
            then
                reproduceEnglishAudioFileIfAvailable $ingles
            else
                downloadAudioFromGoogle $ingles
            fi
            displayOptionToAddNewWord
            read decision
            displayMenu
        fi
    fi
done
