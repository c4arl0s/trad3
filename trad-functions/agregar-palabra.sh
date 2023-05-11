#!/usr/bin/env bash

agregar-palabra()
{
    traduccion=$1
    ingles=$2
    obtener-traduccion $traduccion $ingles
    imprimir-traduccion-ingresada 
    echo -e "is this correct? (tap ENTER) : "
    echo -e ""
    read confirmacion 
    if [ "$confirmacion" = "" ]
        then
            echo "$ROSA"
            echo -e "adding word:$BLANCO $ingles ..."
            crear_archivo_ingles
            transfiere-traduccion-ingles
            crear-archivo-espanol
            transfiere-traduccion-espanol
        else
            exit 0
    fi
}
