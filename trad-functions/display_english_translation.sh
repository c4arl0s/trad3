#!/usr/bin/env bash

display_english_translation()
{
    WORD=$1
    ROWS=$(get_number_of_lines_english_file ${WORD})
    for ROW in `seq ${ROWS}`
    do  
        get_english_fields ${WORD} ${ROW}
        print_english_fields
    done
}
