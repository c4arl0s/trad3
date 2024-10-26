#!/usr/bin/env bash

display_english_translation()
{
    WORD=$1
    ROWS=$(getNumberOfLinesEnglishFile ${WORD})
    for ROW in `seq ${ROWS}`
    do  
        getEnglishFields ${WORD} ${ROW}
        printEnglishFields
    done
}
