#!/usr/bin/env bash

add_word()
{
  translation=$1
  english=$2
  getTranslation ${translation} ${english}
  print_added_translation 
  printf "%s" "is this correct? (tap ENTER) : "; read -r confirmation
  # if [ "${confirmacion}" = "" ]
  if [ -z "${confirmation}" ]; then
    echo -e "${PINK}"
    echo -e "${WHITE}adding word: ${english}"
    createEnglishFile ${english}
    transfer_english_translation
    createSpanishFile ${SPANISH}
    transferSpanishTranslation
  else
    exit 0
  fi
}