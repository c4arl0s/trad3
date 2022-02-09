#!/bin/bash

descargar-audio-de-google()
{
    WORD=$1
    echo -e ""
    echo -e "intentaré descargar la palabra de google ..."
    echo -e "$WHITE"
    descarga_mp3_google $WORD
    convierte_mp3_wav $WORD
    play $AUDIO_DIRECTORY_PATH/$WORD.wav
    echo ""
    echo -e "... se descargo de internet $YELLOW $WORD"
    clear
}

