#!/bin/bash

. ./functions/functions.sh

# at the front of your main script (after the #!/bin/bash) the dot (in bash) is the same as the include directive in c, you don't have to export the functions as the file will be included in the main script, don´t miss the space between the dot and the filename

while [ "$*" = "" ]
do
    printTitle
    read WORD
    if [ "isRetrievableEnglishWord $WORD" ]
    then
         #=================================
        if [[ -z $WORD ]];
        then
            echo "User pressed ENTER with no input text, i will reproduce last word found ...";
            reproduce-audio $WORD
        else
            echo -e "$BLANCO exist $ROSA $WORD $BLANCO into english data base"
            if [ "isRetrievableEnglishAudio $WORD" ]
                then
                    reproduce-audio $WORD
                    sleep 1
                else
                    echo -e "$AMARILLO audio does not exist ... I will use google"
                    descargar-mp3-google $WORD
                    echo -e "$AMARILLO does exits ... converting to wav file"
                    convierte-mp3-wav $WORD
                    echo -e "$AMARILLO reproducing audio"
                    reproduce-audio $WORD
                    sleep 1
            fi
            limpiar-archivo-ingles $WORD
            # clear
            displayEnglishTranslation $WORD
        fi
        #=================================
    else
        #=================================
        echo -e "$ROSA $palabra $BLANCO does not exist on english data base .... now looking into spanish data base"
        prueba-palabra-espanol $palabra
        if [ "$?" = 0 ]
        then
            existe-archivo-en-espanol $palabra
            clear
            desplegar-traduccion-espanol $palabra
            reproduce-audio $INGLES
        else
            buscar-palabra-en-google $palabra
            sleep 1
            prueba-palabra-audio $ingles
            sleep 1
            if [ "$?" = 0 ]
            then
                reproduce-audio $ingles
                sleep 1
            else
                descargar-audio-de-google $ingles
                sleep 1
            fi
            clear
            despliega-opcion-agregar-palabra
            read decision
            despliega-menu-de-decision
        fi
        #==================================
		fi
done
