#!/usr/bin/env bash

downloadAudioFromGoogle()
{
  WORD=$1
  printf "\n${YELLOW}Trying Downloading from google"
  URL="https://ssl.gstatic.com/dictionary/static/sounds/de/0"
  if wget -q --spider ${URL}/${WORD}.mp3 && wget -c ${URL}/${WORD}.mp3 -O ${AUDIO_DIRECTORY_PATH}/${WORD}.mp3 
  then
    printf "\n${GREEN}downloading mp3 file ..."
  else 
    printf "\n${RED}URL is down, try other mean"
  fi
}
