#!/bin/bash

cuenta-lineas-archivo-ingles()
{
    WORD=$1
    cat $ENGLISH_DIRECTORY_PATH/$WORD.txt | wc -l | cut -f 8 -d " "
}
