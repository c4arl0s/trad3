#!/usr/bin/env bash

isRetrievableEnglishAudio()
{
    WORD=$1
    test -f $AUDIO_DIRECTORY_PATH/$WORD.wav
}
