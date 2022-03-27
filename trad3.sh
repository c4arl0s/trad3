#!/bin/bash

. ./trad-functions/functions.sh
. ./add-functions/functions.sh
. ./helper-functions/colors.sh
. ./helper-functions/directoryPaths.sh
. ./helper-functions/cleanEnglishFile.sh
. ./helper-functions/cleanSpanishFile.sh

while [ "$*" = "" ]
do
    printTitle
    read WORD
    if $(isRetrievableEnglishWord $WORD)
    then
        echo -e "$WHITE exist $PINK $WORD $WHITE into english data base" 
        if $(isRetrievableEnglishAudio $WORD)
        then
            reproduce-audio $WORD
            sleep 1
        else
            echo -e "$YELLOW audio does not exist ... I will use google"
            downloadAudioFromGoogle $WORD
            echo -e "$YELLOW does exits ... convert to wav file"
            convertMP3toWAV $WORD
            echo -e "$YELLOW reproducing audio"
            reproduce-audio $WORD
            sleep 1
        fi
        clear
        displayEnglishTranslation $WORD
    else
        echo -e "the word $WORD is not found"
        echo -e "$PINK $WORD $WHITE does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            SPANISH_WORD=$WORD
            cleanSpanishFile $SPANISH_WORD
            clear
            displaySpanishTranslation $SPANISH_WORD
            reproduce-audio $SPANISH_WORD
        else
            searchWordUsingGoogleScript $WORD
            sleep 1 
            if $(isRetrievableEnglishAudio $ingles)
            then
                reproduce-audio $ingles
                sleep 1
            else
                downloadAudioFromGoogle $ingles
                sleep 1
            fi
            clear
            displayOptionToAddNewWord
            read decision
            displayMenu
        fi
    fi
done
