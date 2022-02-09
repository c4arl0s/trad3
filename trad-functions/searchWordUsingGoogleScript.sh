#!/bin/bash

searchWordUsingGoogleScript()
{
    WORD=$1
    echo -e "$PINK buscaré en google-translation script usando la opcion -breve ...$WHITE"
    #======================================================================
    echo -e "buscare $WORD traduciondo al espanol"
    spanishWordUsingTrans=`trans -b :es $WORD | cut -f 1 -d " "`
    #======================================================================
    if [ $WORD = $spanishWordUsingTrans ]
    then
        #================
        echo -e "si la palabra buscada es igual a la traduccion, puede ser una palabra en espanol"
        echo -e "$WHITE al parecer es una palabra en espanol ... traduce palabra al ingles"
        englishWordUsingTrans=`trans -b :eng $WORD | cut -f 1 -d " "`
        #================
        espanol=$WORD
        ingles=$englishWordUsingTrans
    else
        #================
        echo "como palabra y traduccion no son iguales, la palabra esta en inglés."
        echo "traduccion = $traduccion"
        espanol=$spanishWordUsingTrans
        ingles=$WORD
    fi
}
