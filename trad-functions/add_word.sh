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
    create_english_file ${english}
    transfer_english_translation
    create_spanish_file ${SPANISH}
    transfer_spanish_translation
  else
    exit 0
  fi
}
