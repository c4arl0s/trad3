#!/usr/bin/env bash

convertMP3toWAV()
{
    WORD=$1
    ffmpeg -i $AUDIO_DIRECTORY_PATH/$WORD.mp3 $AUDIO_DIRECTORY_PATH/$WORD.wav
}
