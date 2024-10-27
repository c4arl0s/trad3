#!/usr/bin/env bash

get_translation()
{ 
  TRANSLATION=$1
  ENGLISH=$2
  echo -e "${WHITE}"
  SPANISH=${TRANSLATION}
  ENGLISH=${ENGLISH}
  echo -e "English: ${ENGLISH}"
  echo -e "translation: ${TRANSLATION}"
  printf "%s" "Type something extra about your word: "; read algomas
  printf "%s" "Type PAST in case is a verb: "; read p
  printf "%s" "Type PAST PARTICIPE in case is a verb: "; read pp
  printf "%s" "Type GERUND in case is a verb: "; read gerundio
  printf "%s" "Type an example about your word: "; read ejemplo
}
