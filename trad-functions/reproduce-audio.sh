#!/usr/bin/env bash

reproduce-audio()
{
    WORD=$1
    echo "${WHITE}"
    if [[ -f $AUDIO_DIRECTORY_PATH/$WORD.wav ]]; then 
        play $AUDIO_DIRECTORY_PATH/$WORD.wav
    else 
        echo "${RED}I could not find ${WHITE}$WORD ${RED}audio file"
    fi
}
