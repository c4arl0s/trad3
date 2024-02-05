#!/usr/bin/env bash

convertMP3toWAV()
{
  WORD=$1
  if [ -f ${AUDIO_DIRECTORY_PATH}/${WORD}.mp3 ] && ffmpeg -i ${AUDIO_DIRECTORY_PATH}/${WORD}.mp3 ${AUDIO_DIRECTORY_PATH}/${WORD}.wav; then
    printf "\n${GREEN}I was able to convert ${WORD} audio file"
  else 
    printf "\n${RED}Conversion failed"
  fi
}
