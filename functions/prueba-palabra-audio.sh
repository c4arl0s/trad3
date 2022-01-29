#!/bin/bash

isRetrievableEnglishAudio()
{
    WORD=$1
    test -f $directorio_audio/$WORD.wav
}

