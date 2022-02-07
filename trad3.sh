#!/bin/bash

. ./functions/functions.sh

# at the front of your main script (after the #!/bin/bash) the dot (in bash) is the same as the include directive in c, you don't have to export the functions as the file will be included in the main script, don´t miss the space between the dot and the filename

while [ "$*" = "" ]
do
    printTitle
    read WORD
    if $(isRetrievableEnglishWord $WORD)
    then
        #=================================
        echo -e "the word $WORD is found"
        echo -e "$WHITE exist $PINK $WORD $WHITE into english data base" 
        if $(isRetrievableEnglishAudio $WORD)
        then
            reproduce-audio $WORD
            sleep 1
        else
            echo -e "$YELLOW audio does not exist ... I will use google"
            downloadAudioFromGoogle $WORD
            echo -e "$YELLOW does exits ... convert to wav file"
            convertMP3toWAV $WORD
            echo -e "$YELLOW reproducing audio"
            reproduce-audio $WORD
            sleep 1
        fi
        formatEnglishFile $WORD
        # clear
        displayEnglishTranslation $WORD
        #=================================
    else
        #=================================
        echo -e "the word $WORD is not found"
        echo -e "$PINK $WORD $WHITE does not exist on english data base .... now looking into spanish data base"
        if $(isRetrievableSpanishWord $WORD)
        then
            existe-archivo-en-espanol $WORD
            # clear
            desplegar-traduccion-espanol $WORD
            reproduce-audio $INGLES
        else
            buscar-palabra-en-google $WORD
            sleep 1 
            if [ "isRetrievableEnglishAudio $ingles" = 0 ]
            then
                reproduce-audio $ingles
                sleep 1
            else
                descargar-audio-de-google $ingles
                sleep 1
            fi
            # clear
            despliega-opcion-agregar-palabra
            read decision
            despliega-menu-de-decision
        fi
        #==================================
		fi
done
