#!/bin/bash
desplegar-traduccion-espanol()
{
palabra=$1
n=`cuenta-lineas-archivo-espanol $palabra`
echo -e " tiene $n numeros de lineas el archivo $palabra.txt"
echo ""
    for i in `seq $n`       # hace una accion desde i hasta n
                        #for i in $n     # hace una accion desde i hasta n
        do
            obtener-campos-espanol $palabra $i
            imprimir-campos-espanol
        done
}

