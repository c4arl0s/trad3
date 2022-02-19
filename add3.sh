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
        if [ -z $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt ]
        then
            echo ""
            echo "archivo no existe ... se agregara ahora"
            echo ""
            readInputs
            echo "confirmacion de la palabra: "
            echo -e "$WHITE"
            printInputs
            echo -e "es correcto ? (teclee ENTER) : "
            echo -e ""
            read CONFIRMATION
            if [ "$CONFIRMATION" = "" ]
            then
                echo -e "$ROSA agregando palabra $WHITE $ENGLISH .... "
                createEnglishFile
                saveEnglishTranslation
                createSpanishFile
                saveSpanishTranslation        
                if [ "$PAST" = "" ]
                then
                    echo -e " - "    
                else
                    touch $ENGLISH_DIRECTORY_PATH/$PAST.txt
                    echo -e "$PAST es el pasado de $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PAST.txt
                fi
                if [ "$PASTPARTICIPE" = "" ]
                then      
                    echo -e " - "    
                else
                   touch $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
                   echo -e "$PASTPARTICIPE es el pasado participio de $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$PASTPARTICIPE.txt
                fi
                if [ "$GERUND" = "" ]
                then
                    echo -e " - "    
                else
                    touch $ENGLISH_DIRECTORY_PATH/$GERUND.txt
                    echo -e "$GERUND es el gerundio de $ENGLISH / $SPANISH : " >> $ENGLISH_DIRECTORY_PATH/$GERUND.txt
                fi
                cat $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                cat $SPANISH_DIRECTORY_PATH/$SPANISH.txt
            else
                echo ""
                echo "confirmacion nula : no se agregara la palabra"
            fi
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
                       echo -e "$ENGLISH : $SPANISH : $SOMETHINGELSE : $PAST : $PASTPARTICIPE : $GERUND : $EXAMPLE" >> $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                       chmod 777 $SPANISH_DIRECTORY_PATH/$SPANISH.txt
                       echo "" >> $SPANISH_DIRECTORY_PATH/$SPANISH.txt
                       echo -e "$SPANISH : $ENGLISH : $SOMETHINGELSE : $PAST : $PASTPARTICIPE : $GERUND : $EXAMPLE" >> $SPANISH_DIRECTORY_PATH/$SPANISH.txt
                       sed '/^ *$/d' $ENGLISH_DIRECTORY_PATH/$ENGLISH.txt
                       sed '/^ *$/d' $SPANISH_DIRECTORY_PATH/$SPANISH.txt
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
