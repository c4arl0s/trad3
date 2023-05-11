#!/usr/bin/env bash

descargar-audio-de-google()
{
    WORD=$1
    echo -e "intentaré descargar la palabra de google ..."
    echo -e "$WHITE"
    descarga_mp3_google $WORD
    convierte_mp3_wav $WORD
    play $AUDIO_DIRECTORY_PATH/$WORD.wav
    echo -e "... se descargo de internet $YELLOW $WORD"
}

