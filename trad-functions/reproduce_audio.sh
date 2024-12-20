#!/usr/bin/env bash

reproduce_audio()
{
    WORD=$1
    echo -e "${WHITE}"
    if [[ -f ${AUDIO_DIRECTORY_PATH}/${WORD}.wav ]]; then 
        play ${AUDIO_DIRECTORY_PATH}/${WORD}.wav
    else 
        echo -e "${RED}I could not find ${WHITE}${WORD} ${RED}audio file"
    fi
}
