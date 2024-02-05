#!/usr/bin/env bash

printTitle()
{
    ORIGINAL_BASENAME=$1
    printf "\n${CYAN}Looking for a word: (type a word in english/spanish) %s\n" ${ORIGINAL_BASENAME}
    echo -e "The last word found:${ROSA} ${LAST_WORD_FOUND}"
}
