#!/usr/bin/env bash

cleanSpanishFile()
{
    WORD=$1
    #borrar lineas vacias
    sed '/^ *$/d' $SPANISH_DIRECTORY_PATH/$WORD.txt > $TEMPORAL_DIRECTORY_PATH/temporal.txt
    cat $TEMPORAL_DIRECTORY_PATH/temporal.txt > $SPANISH_DIRECTORY_PATH/$WORD.txt
}
