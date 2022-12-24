#!/usr/bin/env bash

downloadAudioFromGoogle()
{
    WORD=$1
    URL='https://ssl.gstatic.com/dictionary/static/sounds/de/0'
    wget -P $AUDIO_DIRECTORY_PATH $URL/$WORD.mp3
}
