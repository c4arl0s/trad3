#!/usr/bin/env bash

display_spanish_translation()
{
    spanish_word=$1
    rows=$(count_lines_spanish_file ${spanish_word})
    # printf "\n${spanish_word} file has $rows rows\n"
    for row in `seq ${rows}`
    do
        get_spanish_fields ${spanish_word} ${row}
        print_spanish_fields
    done
}
