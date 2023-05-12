#!/usr/bin/env bash

. $HOME/iOS-Projects/DictEnEsScript/directoryPaths.sh

function reproduceEnglishAudioFileIfAvailable() {
    WORD=$1
    if $(isRetrievableEnglishAudio $WORD)
    then
        reproduce-audio $WORD
    else
        echo -e "${RED}audio does not exist ... I will use google"
        downloadAudioFromGoogle $WORD
        convertMP3toWAV $WORD
        reproduce-audio $WORD
    fi
}

function reproduceLastWordFoundIfAvailable() {
    LAST_WORD_FOUND=$1
    # (not_empty_string && file_exist && echo && reproduce)
    [[ ! -z "$LAST_WORD_FOUND" ]] &&
    [ -f $AUDIO_DIRECTORY_PATH/$LAST_WORD_FOUND.wav ] && 
    echo "${GREEN}Reproducing last word found ..." && 
    reproduce-audio $LAST_WORD_FOUND
}

while [ "$*" = "" ]
do
    printTitle $(basename $0)
    echo -n "${CYAN}"
    read WORD
    if $(isRetrievableEnglishWord $WORD)
    then
        echo "${GREEN}$WORD is available in english data base"
        reproduceEnglishAudioFileIfAvailable $WORD
        displayEnglishTranslation $WORD

    elif [ "$WORD" = "" ]
    then
        echo "Empty word"        
        LAST_WORD_FOUND=$(echo $INGLES | cut -d ":" -f 1 | tr -d "[:space:]")
        reproduceLastWordFoundIfAvailable $LAST_WORD_FOUND

    else
        echo -e "${RED}$WORD does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            echo "${GREEN}$WORD existe en base de datos de espaniol"
            SPANISH_WORD=$WORD
            cleanSpanishFile $SPANISH_WORD
            displaySpanishTranslation $SPANISH_WORD
            reproduceEnglishAudioFileIfAvailable  $WORD
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
