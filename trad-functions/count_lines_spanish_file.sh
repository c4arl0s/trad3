#!/usr/bin/env bash

count_lines_spanish_file()
{ 
    WORD=$1
    cat ${SPANISH_DIRECTORY_PATH}/${WORD}.txt | wc -l | cut -f 8 -d " "
}
