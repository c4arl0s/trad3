#!/usr/bin/env bash

. $HOME/iOS-Projects/trad3/directoryPaths.sh

readonly NO_ARGUMENTS_MSG="\n${WHITE}You should not provide any argument in this script, you just type trad3"
readonly AVAILABILITY_MSG="\n${WHITE}${WORD} ${GREEN}is available in english data base" 
readonly DOES_NOT_EXIST_ENG_MSG="\n${WHITE}${WORD} ${RED}does not exist on english data base .... now looking into spanish data base"
readonly DOES_NOT_EXIST_SPN_MSG="\n${WHITE}${WORD} ${RED}does exist on spanish data base"
readonly GOOGLE_MSG="It seems that we can find ${WORD} using google script"

last_word_found=

if [ $# -ne 0 ]; then
  echo -e "${NO_ARGUMENTS_MSG}"
  exit 1 
fi

while : ;do
  printTitle $(basename $0)
  echo -e "${WHITE}"
  printf "%s" "Type a word: "; read word
  if $(isRetrievableEnglishWord ${word}); then
    printf ${AVAILABILITY_MSG}
    reproduceEnglishAudioFileIfAvailable ${word}
    displayEnglishTranslation ${word}
    last_word_found=${word}
  elif [ -z "${word}" ]; then
    echo -e "${RED}Empty word"        
    reproduceLastWordFoundIfAvailable ${last_word_found}
  else
    printf ${DOES_NOT_EXIST_ENG_MSG}
    if $(isRetrievableSpanishWord ${word}); then
      printf ${DOES_NOT_EXIST_SPN_MSG}
      SPANISH_WORD=${word}
      cleanSpanishFile ${SPANISH_WORD}
      displaySpanishTranslation ${SPANISH_WORD}
      cleanEnglishWord=$(echo "${INGLES}" | xargs)
      reproduceEnglishAudioFileIfAvailable ${cleanEnglishWord}
      last_word_found=${cleanEnglishWord}
    else
      printf ${GOOGLE_MSG}
      searchWordUsingGoogleScript ${word}
      reproduceEnglishAudioFileIfAvailable ${ingles} 
      displayOptionToAddNewWord
      displayMenu
    fi
  fi
done
