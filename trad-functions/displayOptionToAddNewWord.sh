#!/usr/bin/env bash

displayOptionToAddNewWord()
{
    printf "\n${WHITE}$espanol : $ingles"
    printf "\n${CYAN}Do you want to add this word?:${PINK} $WORD ?"
    printf "%s" "\nType your choice [yes|add3|↩], type enter to ignore: "; read decision
    echo -e "${GREEN}"
}
