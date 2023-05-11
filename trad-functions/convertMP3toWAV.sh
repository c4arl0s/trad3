#!/usr/bin/env bash

convertMP3toWAV()
{
    WORD=$1
    if [ -f $AUDIO_DIRECTORY_PATH/$WORD.mp3 ] && ffmpeg -i $AUDIO_DIRECTORY_PATH/$WORD.mp3 $AUDIO_DIRECTORY_PATH/$WORD.wav; then
        echo "$GREEN I was able to convert $WORD audio file"
    else 
        echo "$RED Conversion failed"
    fi
}
