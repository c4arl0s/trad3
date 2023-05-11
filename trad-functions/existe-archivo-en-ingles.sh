#!/usr/bin/env bash
# este script fue reinsertado en el programa principal, guardarlo.
existe-archivo-en-ingles()
{
    prueba-palabra-audio
    if [ "$?" = 0 ]
        then
            reproduce-audio
        else
            echo "audio no existe ... se buscara en la red"
            descargar-mp3-google               
            convierte-mp3-wav     
            reproduce-audio
        fi 
    echo -e "$VERDE $palabra existe ..."
    limpiar-archivo-ingles $palabra 
}
