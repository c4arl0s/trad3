#!/usr/bin/env bash

downloadAudioFromGoogle()
{
    WORD=$1
    echo "Downloading $WORD from google"
    URL="https://ssl.gstatic.com/dictionary/static/sounds/de/0"
    wget -P $AUDIO_DIRECTORY_PATH $URL/$WORD.mp3
}
