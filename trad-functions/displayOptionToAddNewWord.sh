#!/usr/bin/env bash

displayOptionToAddNewWord()
{
    echo -e "${WHITE}$espanol : $ingles"
    echo -e "${CYAN}Do you want to add this word?${PINK} $WORD?"
    reproduceEnglishAudioFileIfAvailable $ingles
    echo -e "${YELLOW}Type your choice [${GREEN}yes${YELLOW}|${GREEN}add3${YELLOW}|${GREEN}↩${YELLOW}], type enter to ignore"
    echo -e "${YELLOW}"
}
