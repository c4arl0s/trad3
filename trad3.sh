#!/usr/bin/env bash

. $HOME/iOS-Projects/DictEnEsScript/directoryPaths.sh

function reproduceEnglishAudioFileIfAvailable() {
    WORD=$1
    if $(isRetrievableEnglishAudio $WORD)
    then
        reproduce-audio $WORD
        sleep 2
    else
        echo -e "audio does not exist ... I will use google"
        downloadAudioFromGoogle $WORD
        echo -e "it does exits ... convert to wav file"
        convertMP3toWAV $WORD
        echo -e "reproducing audio"
        reproduce-audio $WORD
        sleep 2
    fi
}

function reproduceLastWordFoundIfAvailable() {
    LAST_WORD_FOUND=$1
    # (not_empty_string && file_exist && echo && reproduce)
    [[ ! -z "$LAST_WORD_FOUND" ]] &&
    [ -f $AUDIO_DIRECTORY_PATH/$LAST_WORD_FOUND.wav ] && 
    echo "\nReproducing last word found ..." && 
    reproduce-audio $LAST_WORD_FOUND
}

while [ "$*" = "" ]
do
    printTitle
    echo "$CYAN"
    read WORD
    if $(isRetrievableEnglishWord $WORD)
    then
        echo "$GREEN"
        echo "$WORD is available in english data base"
        reproduceEnglishAudioFileIfAvailable $WORD
        displayEnglishTranslation $WORD

    elif [ "$WORD" = "" ]
    then
        echo "Empty word"        
        LAST_WORD_FOUND=$(echo $INGLES | cut -d ":" -f 1 | tr -d "[:space:]")
        reproduceLastWordFoundIfAvailable $LAST_WORD_FOUND

    else
        echo -e "$RED"
        echo -e "$WORD does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            echo "$GREEN"
            echo "$WORD existe en base de datos de espaniol"
            SPANISH_WORD=$WORD
            cleanSpanishFile $SPANISH_WORD
            displaySpanishTranslation $SPANISH_WORD
            reproduceEnglishAudioFileIfAvailable  $WORD
        else
            searchWordUsingGoogleScript $WORD
            sleep 2 
            if $(isRetrievableEnglishAudio $ingles)
            then
                reproduceEnglishAudioFileIfAvailable $ingles
                sleep 2
            else
                downloadAudioFromGoogle $ingles
                sleep 2
            fi
            displayOptionToAddNewWord
            read decision
            displayMenu
        fi
    fi
done
