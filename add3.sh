#!/bin/bash
# script to add new english words to my personal dictionary

. ./helper-functions/colors.sh
. ./helper-functions/directoryPaths.sh
. ./add-functions/functions.sh

while [ "$*" = "" ]  
do
    printHeader
    read ENGLISH
    if [[ $ENGLISH ]]
    then 
        if [[ ! -f "$ENGLISH_DIRECTORY_PATH/$ENGLISH.txt" ]]
        then
            echo ""
            echo "file does not exist ... read inputs from standard input"
            echo ""
            readInputs
            echo "this information will be added: "
            echo -e "$WHITE"
            printInputs
            echo -e "is correct? (type ENTER key) : "
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
        else		
            echo -e "$GREEN"
            echo "la palabra existe"
            echo -e "$WHITE"
            cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
            echo ""
            echo -e "$RED"
            echo "¿ desea agregar otro signicado a la palabra [y/n]? "
            echo "¿ o editar archivo [e] ?"
            echo -e " $WHITE"
            read OPTION
            case $OPTION in
            "yes") echo -e "$RED"
                   echo "dijiste YES"
                   readInputs
                   echo "confirmacion de la palabra: "
                   printInputs
                   read OPTION
                   if [ "$OPTION" = "" ]
                   then
                       saveEnglishTranslation
                       saveSpanishTranslation 
                   else
                       echo ""
                       echo " $WHITE !!! confirmacion nula : no se agregara la palabra ¡¡¡ "
                   fi
                   ;;      		     	
            "no") echo ""
        	  echo "dijiste NO"
                  ;;
            "editar") echo ""
                      vim $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                      vim $SPANISH_DIRECTORY_PATH/$SPANISH.txt
        	      ;;
            *) echo "oprime tecla correcta"
               echo ""
               ;;
            esac
        fi
    else
        echo "Type a word"
    fi	
done
