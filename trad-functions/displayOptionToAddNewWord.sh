#!/usr/bin/env bash

displayOptionToAddNewWord()
{
    printf "\n${WHITE}$espanol : $ingles"
    printf "\n${CYAN}Do you want to add this word?:${PINK} $WORD?"
    printf "\n${YELLOW}Type your choice [${GREEN}yes${YELLOW}|${GREEN}add3${YELLOW}|${GREEN}↩${YELLOW}], type enter to ignore:"
    echo -e "${GREEN}"
}
