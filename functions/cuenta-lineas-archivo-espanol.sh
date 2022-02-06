#!/bin/bash

cuenta-lineas-archivo-espanol()
{ 
    WORD=$1
    cat $directorio_espanol/$WORD.txt | wc -l | cut -f 8 -d " "
}
