#!/usr/bin/env bash

downloadAudioFromGoogle()
{
    WORD=$1
    echo "Downloading $WORD from google"
    URL="https://ssl.gstatic.com/dictionary/static/sounds/de/0"
    wget -q --spider $URL/$WORD.mp3 &&
    wget -c $URL/$WORD.mp3 -O $AUDIO_DIRECTORY_PATH/$WORD.mp3
}
