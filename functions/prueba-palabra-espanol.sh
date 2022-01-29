#!/bin/bash

prueba-palabra-espanol()
{
palabra=$1
test -f $directorio_espanol/$palabra.txt	#prueba si el archivo existe
}

