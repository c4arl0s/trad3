#!/bin/bash

isRetriavableEnglishAudio()
{
    WORD=$1
    test -f $directory_audio/$WORD.wav
}
