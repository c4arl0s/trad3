#!/bin/bash

cuenta-lineas-archivo-ingles()
{
palabra=$1
cat $directorio_ingles/$palabra.txt | wc -l | cut -f 8 -d " "
}







