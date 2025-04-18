#!/usr/bin/env bash

reproduce_english_audio_file_if_available() {
  WORD=$1
  if $(is_retrievable_english_audio ${WORD})
  then
    reproduce_audio ${WORD}
  else
    printf "\n${RED}Audio file does not exist ... I gonna use google"
    download_audio_from_google ${WORD}
    convert_mp3_to_wav ${WORD}
    reproduce_audio ${WORD}
  fi
}
