#!/usr/bin/env bash
# script to add new english words to my personal dictionary

. $HOME/iOS-Projects/DictEnEsScript/directoryPaths.sh

while [ -z "$*" ]
do
    printHeader
    read ENGLISH
    if $(isRetrievableEnglishWord $ENGLISH)
    then
        echo "${GREEN}$ENGLISH exist"
        echo -e "${WHITE}"
        cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
        echo -e "${RED}"
        echo "${WHITE}Do you wish to add another meaning? type: [yes/no/edit]?"
        read OPTION
        case $OPTION in
        "yes") echo -e "${RED}"
               readInputs
               echo "${GREEN}these are your changes: "
               printInputs
               echo "Type yes to confirm"
               read OPTION
               case $OPTION in 
                   "yes") echo -e "${RED}Saving $ENGLISH ..."
                          saveEnglishTranslation
                          cleanEnglishFile $ENGLISH
                          saveSpanishTranslation 
                          saveVerb $PAST $PASTPARTICIPE $GERUND
                          cleanSpanishFile $SPANISH
                          cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt;;
                    "no") echo -e "${RED}"
                          echo "${RED}You cancelled operation";;
                    *) echo "${RED}Type correct key";;
              esac;;
        "no") echo "Create a task when you say no";;
        "edit") vim $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                vim $SPANISH_DIRECTORY_PATH/$SPANISH.txt;;
        *) echo "${RED}type correct key";;
        esac
    elif [ -z "$ENGLISH" ]
    then 
        echo "${CYAN}Empty word"
    else
        echo "file does not exist ... read inputs from standard input"
        readInputs
        echo "this information will be added: "
        echo -e "${WHITE}"
        printInputs
        echo -e "Select a number: "
        select CONFIRMATION in yes no quit; do
        case $CONFIRMATION in
        yes) echo -e "${ROSA}adding word:${WHITE} $ENGLISH .... "
               createEnglishFile
               saveEnglishTranslation
               createSpanishFile
               saveSpanishTranslation        
               saveVerb $PAST $PASTPARTICIPE $GERUND
               cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
               cat $SPANISH_DIRECTORY_PATH/$SPANISH.txt
               break;;
        no) echo "${RED}you said no"
            break;;
        quit) break;;
        *) echo "${RED}Wrong keys";;
        esac
        done
    fi
done
