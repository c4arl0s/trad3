#!/usr/bin/env bash

. $HOME/iOS-Projects/trad3/directoryPaths.sh

LAST_WORD_FOUND=

if [ $# -ne 0 ]; then
   echo -e "\n${WHITE}You should not provide any argument in this script, you just type trad3"
   exit 1 
fi

while : 
do
    printTitle $(basename $0)
    echo -e "${WHITE}"
    printf "%s" "Type a word: "; read WORD
    if $(isRetrievableEnglishWord $WORD)
    then
        printf "\n${WHITE}$WORD ${GREEN}is available in english data base"
        reproduceEnglishAudioFileIfAvailable $WORD
        displayEnglishTranslation $WORD
        LAST_WORD_FOUND=$WORD
    elif [ -z "$WORD" ]
    then
        echo -e "${RED}Empty word"        
        reproduceLastWordFoundIfAvailable $LAST_WORD_FOUND
    else
        printf "\n${WHITE}$WORD ${RED}does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            printf "\n${WHITE}$WORD ${RED}does exist on spanish data base"
            SPANISH_WORD=$WORD
            cleanSpanishFile $SPANISH_WORD
            displaySpanishTranslation $SPANISH_WORD
            cleanEnglishWord=$(echo "${INGLES}" | xargs)
            reproduceEnglishAudioFileIfAvailable $cleanEnglishWord
            LAST_WORD_FOUND=$cleanEnglishWord
        else
            printf "It seems that we can find ${WORD} using google script"
            searchWordUsingGoogleScript $WORD
            reproduceEnglishAudioFileIfAvailable $ingles 
            displayOptionToAddNewWord
            displayMenu
        fi
    fi
done
