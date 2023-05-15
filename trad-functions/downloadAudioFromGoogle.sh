#!/usr/bin/env bash

downloadAudioFromGoogle()
{
    WORD=$1
    echo "${WHITE}Downloading $WORD from google"
    URL="https://ssl.gstatic.com/dictionary/static/sounds/de/0"
    if wget -q --spider $URL/$WORD.mp3 && wget -c $URL/$WORD.mp3 -O $AUDIO_DIRECTORY_PATH/$WORD.mp3 
    then
        echo "${GREEN}downloading mp3 file ..."
    else 
        echo "${RED}URL is down, try other mean"
    fi
}
