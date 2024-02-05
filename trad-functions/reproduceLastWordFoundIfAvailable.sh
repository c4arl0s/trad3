#!/usr/bin/env bash

function reproduceLastWordFoundIfAvailable() {
  LAST_WORD_FOUND=$1
  # (not_empty_string && file_exist && echo && reproduce)
  [[ ! -z "${LAST_WORD_FOUND}" ]] &&
  [ -f ${AUDIO_DIRECTORY_PATH}/${LAST_WORD_FOUND}.wav ] && 
  printf "\n${GREEN}Reproducing last word found ..." && 
  reproduce-audio ${LAST_WORD_FOUND}
}
