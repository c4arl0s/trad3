#!/usr/bin/env bash

search_word_using_google_script()
{
  WORD=$1
  printf "\n${YELLOW}I´m gonna look using google-translation script, brief option"
  spanishWordUsingTrans=`bash ${HOME}/iOS-Projects/trad3/trans -b :es ${WORD} | cut -f 1 -d " "`
  if [ ${WORD} = ${spanishWordUsingTrans} ]
  then
      printf "\nIt seems the word you are looking for It is the same as spanish word"
      englishWordUsingTrans=`trans -b :eng ${WORD} | cut -f 1 -d " "`
      espanol=${WORD}
      ingles=${englishWordUsingTrans}
  else
      printf "\nIt seems is an english word"
      espanol=${spanishWordUsingTrans}
      ingles=${WORD}
  fi
}

# install trans script
# wget git.io/trans
# chmod +x ./trans
