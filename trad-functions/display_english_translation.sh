#!/usr/bin/env bash

display_english_translation()
{
    WORD=$1
    ROWS=$(getNumberOfLinesEnglishFile ${WORD})
    for ROW in `seq ${ROWS}`
    do  
        get_english_fields ${WORD} ${ROW}
        printEnglishFields
    done
}
