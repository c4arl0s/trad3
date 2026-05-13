#!/usr/bin/env bash

reproduce_english_audio_file_if_available() {
  WORD=$1
  if $(is_retrievable_english_audio ${WORD})
  then
    reproduce_audio ${WORD}
  else
    printf "\n${RED}Audio file does not exist\n"
    download_word_audio -w ${WORD}
    convert_mp3_to_wav ${WORD}
    reproduce_audio ${WORD}
  fi
}
