#!/usr/bin/env bash

displayEnglishTranslation()
{
    WORD=$1
    ROWS=$(getNumberOfLinesEnglishFile ${WORD})
    for ROW in `seq ${ROWS}`
    do  
        getEnglishFields ${WORD} ${ROW}
        printEnglishFields
    done
}
