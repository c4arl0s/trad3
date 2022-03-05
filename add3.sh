#!/bin/bash
# script to add new english words to my personal dictionary

. ./helper-functions/colors.sh
. ./helper-functions/directoryPaths.sh
. ./helper-functions/cleanEnglishFile.sh
. ./helper-functions/cleanSpanishFile.sh
. ./add-functions/functions.sh
. ./trad-functions/isRetrievableEnglishWord.sh

while [ "$*" = "" ]  
do
    printHeader
    read ENGLISH
    if [[ $ENGLISH ]]
    then 
        if $(isRetrievableEnglishWord $ENGLISH)
        then
            echo -e "$GREEN"
            echo "$ENGLISH exist"
            echo -e "$WHITE"
            cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
            echo ""
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
            "no") echo ""
        	  echo "Create a task when you say no";;
            "edit") echo ""
                    vim $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                    vim $SPANISH_DIRECTORY_PATH/$SPANISH.txt;;
            *) echo "type correct key"
               echo "";;
            esac
        else
            echo ""
            echo "file does not exist ... read inputs from standard input"
            echo ""
            readInputs
            echo "this information will be added: "
            echo -e "$WHITE"
            printInputs
            echo -e ""
            echo -e "Select a number: "
            echo -e ""
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
    else
        echo "Type a word"
    fi	
done
