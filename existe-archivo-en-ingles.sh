#!/bin/bash
# este script fue reinsertado en el programa principal, guardarlo.
existe-archivo-en-ingles()
{
prueba-palabra-audio

    if [ "$?" = 0 ]
        then
            reproduce-audio
        else
            echo "audio no existe ... se buscara en la red"
            descargar-mp3-google                 #si no existe, descargalo.
            convierte-mp3-wav                   #conviertelo
            reproduce-audio
        fi 
echo ""	
echo -e "$VERDE $palabra existe ..."
echo ""
limpiar-archivo-ingles $palabra 
}


