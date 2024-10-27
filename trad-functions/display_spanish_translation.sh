#!/usr/bin/env bash

display_spanish_translation()
{
    SPANISH_WORD=$1
    ROWS=`count_lines_spanish_file ${SPANISH_WORD}`
    # printf "\n${WORD} file has $ROWS rows\n"
    for ROW in `seq ${ROWS}`
    do
        getSpanishFields ${WORD} ${ROW}
        print_spanish_fields
    done
}
