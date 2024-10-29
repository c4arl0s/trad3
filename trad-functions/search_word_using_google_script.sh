#!/usr/bin/env bash

search_word_using_google_script()
{
  word=$1
  printf "\n${YELLOW}I´m gonna look using google-translation script, brief option"
  spanish_word_using_trans=$(bash ${TRAD3_PATH}/trans -b :es ${word} | cut -f 1 -d " ")
  if [ "${word}" = "${spanish_word_using_trans}" ]
  then
      printf "\nIt seems the word you are looking for It is the same as spanish word"
      english_word_using_trans=$(trans -b :eng ${word} | cut -f 1 -d " ")
      espanol=${word}
      ingles=${english_word_using_trans}
  else
      printf "\nIt seems is an english word"
      espanol=${spanish_word_using_trans}
      ingles=${word}
  fi
}

# install trans script
# wget git.io/trans
# chmod +x ./trans
