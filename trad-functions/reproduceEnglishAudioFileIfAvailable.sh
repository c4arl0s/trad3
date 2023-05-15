#!/usr/bin/env bash

reproduceEnglishAudioFileIfAvailable() {
    WORD=$1
    if $(isRetrievableEnglishAudio $WORD)
    then
        reproduce-audio $WORD
    else
        printf "\n${RED}Audio file does not exist ... I gonna use google"
        downloadAudioFromGoogle $WORD
        convertMP3toWAV $WORD
        reproduce-audio $WORD
    fi
}
