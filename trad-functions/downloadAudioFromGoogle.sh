#!/usr/bin/env bash

downloadAudioFromGoogle()
{
    WORD=$1
    echo "Downloading $WORD from google"
    URL="https://ssl.gstatic.com/dictionary/static/sounds/de/0"
    if wget -q --spider $URL/$WORD.mp3 && wget -c $URL/$WORD.mp3 -O $AUDIO_DIRECTORY_PATH/$WORD.mp3 
    then
        echo "downloading mp3 file"
    else 
        echo "URL is down"
    fi
}
