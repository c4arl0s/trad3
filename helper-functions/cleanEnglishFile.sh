#!/usr/bin/env bash

cleanEnglishFile()
{
    WORD=$1
    #borrar lineas vacias
    sed '/^ *$/d' $ENGLISH_DIRECTORY_PATH/$WORD.txt > $TEMPORAL_DIRECTORY_PATH/temporal.txt
    cat $TEMPORAL_DIRECTORY_PATH/temporal.txt > $ENGLISH_DIRECTORY_PATH/$WORD.txt
}
