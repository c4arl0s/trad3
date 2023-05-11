#!/usr/bin/env bash
# script to add new english words to my personal dictionary

. $HOME/iOS-Projects/DictEnEsScript/directoryPaths.sh

while [ "$*" = "" ]  
do
    printHeader
    read ENGLISH
    if $(isRetrievableEnglishWord $ENGLISH)
    then
        echo -e "$GREEN"
        echo "$ENGLISH exist"
        echo -e "$WHITE"
        cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
        echo -e "$RED"
        echo "¿ Do you wish to add another meaning? type: [yes/no/edit]? "
        echo -e " $WHITE"
        read OPTION
        case $OPTION in
        "yes") echo -e "$RED"
               readInputs
               echo "these are your changes: "
               printInputs
               echo "Type yes to confirm"
               read OPTION
               case $OPTION in 
                   "yes") echo -e "$RED"
                          echo -e "Saving $ENGLISH ..."
                          saveEnglishTranslation
                          cleanEnglishFile $ENGLISH
                          saveSpanishTranslation 
                          saveVerb $PAST $PASTPARTICIPE $GERUND
                          cleanSpanishFile $SPANISH
                          cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt;;
                    "no") echo -e "$RED"
                          echo "You cancelled operation";;
                    *) echo "Type correct key";;
              esac;;
        "no") echo "Create a task when you say no";;
        "edit") vim $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                vim $SPANISH_DIRECTORY_PATH/$SPANISH.txt;;
        *) echo "type correct key";;
        esac
    elif [ "$ENGLISH" = "" ]
    then 
        echo "$CYAN"
        echo "Empty word"
    else
        echo "file does not exist ... read inputs from standard input"
        readInputs
        echo "this information will be added: "
        echo -e "$WHITE"
        printInputs
        echo -e "Select a number: "
        select CONFIRMATION in yes no quit; do
        case $CONFIRMATION in
        yes) echo -e "$ROSA adding word: $WHITE $ENGLISH .... "
               createEnglishFile
               saveEnglishTranslation
               createSpanishFile
               saveSpanishTranslation        
               saveVerb $PAST $PASTPARTICIPE $GERUND
               cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
               cat $SPANISH_DIRECTORY_PATH/$SPANISH.txt
               break;;
        no) echo "you said no"
            break;;
        quit) break;;
        *) echo "Wrong keys";;
        esac
        done
    fi
done
