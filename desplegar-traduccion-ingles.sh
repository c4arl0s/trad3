#!/bin/bash
desplegar-traduccion-ingles()
{
palabra=$1
n=`cuenta-lineas-archivo-ingles $palabra`
echo -e "$BLANCO Existen $n significados de la palabra $palabra"
    for i in `seq $n`	# hace una accion desde i hasta n
        do
            obtener-campos-ingles $palabra $i
            imprimir-campos-ingles
        done
}

