#!/usr/bin/env bash

. /Users/carlossantiagocruz/iOS-Projects/DictEnEsScript/directoryPaths.sh

# initialise trap to call trap_ctrlc function
# when signal 2 (SIGINT) is received
trap trap_ctrlc 2

# this function is called when Ctrl-C is sent
function trap_ctrlc ()
{
    # perform cleanup here
    echo "Ctrl-C caught...performing clean up"
 
    echo "Doing cleanup"
 
    # exit shell script with error code 2
    # if omitted, shell script will continue execution
    exit 2
}
 
while [ "$*" = "" ]
do
    printTitle
    echo "$CYAN"
    read WORD
    if ! $(isRetrievableEnglishWord $WORD)
    then
        echo "$WHITE"
        echo "$WORD is available in english data base"
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
        clear
        displayEnglishTranslation $WORD
    else
        echo -e "$RED"
        echo -e "The word $WORD was not found"
        echo -e "$WORD does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            SPANISH_WORD=$WORD
            cleanSpanishFile $SPANISH_WORD
            clear
            displaySpanishTranslation $SPANISH_WORD
            reproduce-audio $WORD
        else
            searchWordUsingGoogleScript $WORD
            sleep 2 
            if $(isRetrievableEnglishAudio $ingles)
            then
                reproduce-audio $ingles
                sleep 2
            else
                downloadAudioFromGoogle $ingles
                sleep 2
            fi
            clear
            displayOptionToAddNewWord
            read decision
            displayMenu
        fi
    fi
done
