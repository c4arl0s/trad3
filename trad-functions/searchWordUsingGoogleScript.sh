#!/usr/bin/env bash

searchWordUsingGoogleScript()
{
    WORD=$1
    echo -e "Buscaré en google-translation script usando la opcion -breve ...$WHITE"
    echo -e "Buscare $WORD traduciondo al espanol"
    spanishWordUsingTrans=`bash $HOME/iOS-Projects/DictEnEsScript/trans -b :es $WORD | cut -f 1 -d " "`
    # echo "output variable $spanishWordUsingTrans"
    if [ $WORD = $spanishWordUsingTrans ]
    then
        echo -e "Si la palabra buscada es igual a la traduccion, puede ser una palabra en espanol"
        echo -e "Al parecer es una palabra en espanol ... traduce palabra al ingles"
        englishWordUsingTrans=`trans -b :eng $WORD | cut -f 1 -d " "`
        espanol=$WORD
        ingles=$englishWordUsingTrans
    else
        echo "como palabra y traduccion no son iguales, la palabra esta en inglés."
        espanol=$spanishWordUsingTrans
        ingles=$WORD
    fi
}

# install trans script
# wget git.io/trans
# chmod +x ./trans
