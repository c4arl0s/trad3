#!/usr/bin/env bash

. ${TRAD3_PATH}/directory_paths.sh

readonly NO_ARGUMENTS_MSG="\n${WHITE}You should not provide any argument in this script, you just type trad3"
readonly AVAILABILITY_MSG="\n${WHITE}${WORD} ${GREEN}is available in english data base" 
readonly DOES_NOT_EXIST_ENG_MSG="\n${WHITE}${WORD} ${RED}does not exist on english data base .... now looking into spanish data base"
readonly DOES_NOT_EXIST_SPN_MSG="\n${WHITE}${WORD} ${RED}does exist on spanish data base"
readonly GOOGLE_MSG="It seems that we can find ${WORD} using google script"

last_word_found=

if [ $# -ne 0 ]; then
  echo -e "${NO_ARGUMENTS_MSG}"
  return 1 
fi

process_english_word() {
  local word=$1
  printf ${AVAILABILITY_MSG}
  reproduce_english_audio_file_if_available ${word}
  display_english_translation ${word}
  last_word_found=${word}
}

process_spanish_word() {
  local word=$1
  printf ${DOES_NOT_EXIST_SPN_MSG}
  spanish_word=${word}
  clean_spanish_file ${spanish_word}
  display_spanish_translation ${spanish_word}
  clean_english_word=$(echo "${INGLES}" | xargs)
  reproduce_english_audio_file_if_available ${clean_english_word}
  last_word_found=${clean_english_word}
}

process_unknown_word() {
  local word=$1
  printf ${GOOGLE_MSG}
  search_word_using_google_script ${word}
  reproduce_english_audio_file_if_available ${ingles} 
  display_option_to_add_new_word
  display_menu
}

process_empty_word() {
  echo -e "${RED}Empty word"        
  reproduce_last_word_found_if_available ${last_word_found}
}

while : ; do
  print_title $(basename $0)
  echo -e "${WHITE}"
  printf "%s" "Type a word: "; read word
  
  if [ -z "${word}" ]; then
    process_empty_word
    continue
  fi
  
  if $(is_retrievable_english_word ${word}); then
    process_english_word "${word}"
  else
    printf ${DOES_NOT_EXIST_ENG_MSG}
    if $(is_retrievable_spanish_word ${word}); then
      process_spanish_word "${word}"
    else
      process_unknown_word "${word}"
    fi
  fi
done
