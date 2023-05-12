#!/usr/bin/env bash

displayOptionToAddNewWord()
{
    echo -e "${WHITE}$espanol : $ingles"
    echo -e "${CYAN}Do you want to add this word?${PINK} $WORD?"
    echo -e "${WHITE}Type${CYAN} yes${WHITE}to add."
    echo -e "Type enter to ignore"
    echo -e "Type add3 to start script"
    echo -e "${YELLOW}"
    play $AUDIO_DIRECTORY_PATH/$ingles.wav
    echo -e "${YELLOW}"
    echo -e "type your choice [yes|add3], type enter to ignore"
    echo -e "${YELLOW}"
}
