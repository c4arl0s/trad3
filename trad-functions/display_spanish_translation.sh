#!/usr/bin/env bash

displaySpanishTranslation()
{
    SPANISH_WORD=$1
    ROWS=`countLinesSpanishFile ${SPANISH_WORD}`
    # printf "\n${WORD} file has $ROWS rows\n"
    for ROW in `seq ${ROWS}`
    do
        getSpanishFields ${WORD} ${ROW}
        printSpanishFields
    done
}
