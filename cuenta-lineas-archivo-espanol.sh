#!/bin/bash

cuenta-lineas-archivo-espanol()
{ 
palabra=$1
cat $directorio_espanol/$palabra.txt | wc -l | cut -f 8 -d " "
}
