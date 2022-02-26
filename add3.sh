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
            echo "word exist"
            echo -e "$WHITE"
            cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
            echo ""
            echo -e "$RED"
            echo "¿ desea agregar otro signicado a la palabra [yes/no]? "
            echo "¿ o editar archivo [edit] ?"
            echo -e " $WHITE"
            read OPTION
            case $OPTION in
            "yes") echo -e "$RED"
                   readInputs
                   echo "these are your changes: "
                   printInputs
                   echo "Type ENTER to confirm"
                   read OPTION
                   if [[ $OPTION ]]
                   then
                       echo ""
                       echo "$WHITE you cancelled ! "
                   else
                       saveEnglishTranslation
                       cleanEnglishFile $ENGLISH
                       saveSpanishTranslation 
                       cleanSpanishFile $SPANISH
                   fi
                   ;;      		     	
            "no") echo ""
        	  echo "dijiste NO"
                  ;;
            "edit") echo ""
                      vim $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                      vim $SPANISH_DIRECTORY_PATH/$SPANISH.txt
        	      ;;
            *) echo "oprime tecla correcta"
               echo ""
               ;;
            esac
        else
            echo ""
            echo "file does not exist ... read inputs from standard input"
            echo ""
            readInputs
            echo "this information will be added: "
            echo -e "$WHITE"
            printInputs
            echo -e "is correct? (type yes) : "
            echo -e ""
            read CONFIRMATION
            case $CONFIRMATION in
            "yes") echo -e "$ROSA adding word: $WHITE $ENGLISH .... "
                   createEnglishFile
                   saveEnglishTranslation
                   createSpanishFile
                   saveSpanishTranslation        
                   processVerb
                   cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                   cat $SPANISH_DIRECTORY_PATH/$SPANISH.txt
                   ;;
            "no") echo "you said no";;
            *) echo "Wrong keys";;
            esac
        fi
    else
        echo "Type a word"
    fi	
done
