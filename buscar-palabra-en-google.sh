#!/bin/bash
buscar-palabra-en-google()
{
palabra=$1
echo -e "$ROSA buscaré en google-translation script usando la opcion -breve ...$BLANCO"
#======================================================================
echo -e "buscare $palabra traduciondo al espanol"
intento_traduccion_al_espanol=`trans -b :es $palabra | cut -f 1 -d " "`
#======================================================================
    if [ $palabra = $intento_traduccion_al_espanol ]
    then
        #================
        echo -e "si la palabra buscada es igual a la traduccion, puede ser una palabra en espanol"
        echo -e "$BLANCO al parecer es una palabra en espanol ... traduce palabra al ingles"
        traduccion_al_ingles=`trans -b :eng $palabra | cut -f 1 -d " "`
        #================
        espanol=$palabra
        ingles=$traduccion_al_ingles
    else
        #================
        echo "como palabra y traduccion no son iguales, la palabra esta en inglés."
        echo "traduccion = $traduccion"
        espanol=$intento_traduccion_al_espanol
        ingles=$palabra
    fi
}
