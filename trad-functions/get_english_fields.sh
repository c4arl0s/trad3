#!/usr/bin/env bash

get_english_fields()
{
    printf "\n${CYAN}Getting English fields\n\n"
    WORD=$1
    ROW=$2
    FILE_NAME="${ENGLISH_DIRECTORY_PATH}/${WORD}.txt"

    ENGLISH=`echo "$(<${FILE_NAME})" | tail -${ROW} | cut -f 1 -d ":"`
    SPANISH=`echo "$(<${FILE_NAME})" | tail -${ROW} | cut -f 2 -d ":"`
    EXTRA=`echo "$(<${FILE_NAME})" | tail -${ROW} | cut -f 3 -d ":"`
    P=`echo "$(<${FILE_NAME})" | tail -${ROW} | cut -f 4 -d ":"`
    PP=`echo "$(<${FILE_NAME})" | tail -${ROW} | cut -f 5 -d ":"`
    G=`echo "$(<${FILE_NAME})" | tail -${ROW} | cut -f 6 -d ":"`
    E=`echo "$(<${FILE_NAME})" | tail -${ROW} | cut -f 7 -d ":"`
}
