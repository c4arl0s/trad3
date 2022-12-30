#!/usr/bin/env bash

getEnglishFields()
{
    echo "Getting English fields"
    WORD=$1
    ROW=$2
    FILE_NAME="$ENGLISH_DIRECTORY_PATH/$WORD.txt"

    INGLES=`echo "$(<$FILE_NAME)" | tail -$ROW | cut -f 1 -d ":"`
    ESPANOL=`echo "$(<$FILE_NAME)" | tail -$ROW | cut -f 2 -d ":"`
    EXTRA=`echo "$(<$FILE_NAME)" | tail -$ROW | cut -f 3 -d ":"`
    P=`echo "$(<$FILE_NAME)" | tail -$ROW | cut -f 4 -d ":"`
    PP=`echo "$(<$FILE_NAME)" | tail -$ROW | cut -f 5 -d ":"`
    G=`echo "$(<$FILE_NAME)" | tail -$ROW | cut -f 6 -d ":"`
    E=`echo "$(<$FILE_NAME)" | tail -$ROW | cut -f 7 -d ":"`
}
