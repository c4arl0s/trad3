# trad3

This is a new repository for my script trad3. It translate in a basic way an English word to Spanish and viceversa.
It uses my own database which come from my old days of school. When I just needed to understand a word I just looked for it in a dictionary, and put it in a txt file. This txt files when the time went by it became a large data base of words, this script access to it and also make a request to find it in google translate web service in case the word does not exist. 
![](https://github.com/carlos-santiago-2017/DictEnEsScript/blob/master/1.gif)

# dependencies:

gawk

```console
brew install gawk
```

trans script 

```console
wget git.io/trans
chmod +x ./trans
```

sox

```console
brew install sox
```

# Using script

First give permisions to execute script on your environment

```console
$ chmod +x trad.sh
```

You just execute the script by typing:

```console
$ ./trad3.sh
```

# Code

```bash
#!/usr/bin/env bash

. $HOME/iOS-Projects/trad3/directoryPaths.sh

readonly NO_ARGUMENTS_MSG="\n${WHITE}You should not provide any argument in this script, you just type trad3"
readonly AVAILABILITY_MSG="\n${WHITE}${WORD} ${GREEN}is available in english data base" 
readonly DOES_NOT_EXIST_ENG_MSG="\n${WHITE}${WORD} ${RED}does not exist on english data base .... now looking into spanish data base"
readonly DOES_NOT_EXIST_SPN_MSG="\n${WHITE}${WORD} ${RED}does exist on spanish data base"
readonly GOOGLE_MSG="It seems that we can find ${WORD} using google script"

LAST_WORD_FOUND=

if [ $# -ne 0 ]; then
  echo -e "${NO_ARGUMENTS_MSG}"
  exit 1 
fi

while : ;do
  printTitle $(basename $0)
  echo -e "${WHITE}"
  printf "%s" "Type a word: "; read WORD
  if $(isRetrievableEnglishWord ${WORD}); then
    printf ${AVAILABILITY_MSG}
    reproduceEnglishAudioFileIfAvailable ${WORD}
    displayEnglishTranslation ${WORD}
    LAST_WORD_FOUND=${WORD}
  elif [ -z "${WORD}" ]; then
    echo -e "${RED}Empty word"        
    reproduceLastWordFoundIfAvailable ${LAST_WORD_FOUND}
  else
    printf ${DOES_NOT_EXIST_ENG_MSG}
    if $(isRetrievableSpanishWord ${WORD}); then
      printf ${DOES_NOT_EXIST_SPN_MSG}
      SPANISH_WORD=${WORD}
      cleanSpanishFile ${SPANISH_WORD}
      displaySpanishTranslation ${SPANISH_WORD}
      cleanEnglishWord=$(echo "${INGLES}" | xargs)
      reproduceEnglishAudioFileIfAvailable ${cleanEnglishWord}
      LAST_WORD_FOUND=${cleanEnglishWord}
    else
      printf ${GOOGLE_MSG}
      searchWordUsingGoogleScript ${WORD}
      reproduceEnglishAudioFileIfAvailable ${ingles} 
      displayOptionToAddNewWord
      displayMenu
    fi
  fi
done
```

# code `add3.sh`

```bash
#!/usr/bin/env bash
# script to add new english words to my personal dictionary

. $HOME/iOS-Projects/trad3/directoryPaths.sh

if [ $# -ne 0 ]; then
   echo -e "\nYou should not provide any argument in this script, you just type add3"
   return 
fi

while :
do
  printHeader $(basename $0)
  if $(isRetrievableEnglishWord ${ENGLISH}); then
    echo "${GREEN}$ENGLISH exist"
    echo -e "${WHITE}"
    cat ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
    echo -e "${RED}"
    printf "%s" "Do you wish to add another meaning? type: [yes/no/edit]?: "; read OPTION
    case ${OPTION} in
    "yes") echo -e "${RED}"
           readInputs
           echo "${GREEN}these are your changes: "
           printInputs
           printf "%s" "Type yes to confirm: "; read OPTION
           case ${OPTION} in 
               "yes") echo -e "${RED}Saving ${ENGLISH} ..."
                      saveEnglishTranslation
                      cleanEnglishFile ${ENGLISH}
                      saveSpanishTranslation 
                      saveVerb ${PAST} ${PASTPARTICIPE} ${GERUND}
                      cleanSpanishFile ${SPANISH}
                      cat ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt;;
                "no") echo -e "${RED}"
                      echo -e "${RED}You cancelled operation";;
                *) echo -e "${RED}Type correct key";;
          esac;;
    "no") echo -e "Create a task when you say no";;
    "edit") vim ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
            vim ${SPANISH_DIRECTORY_PATH}/${SPANISH}.txt;;
    *) echo -e "${RED}type correct key";;
    esac
  elif [ -z "${ENGLISH}" ]; then 
    echo -e "${CYAN}Empty word"
  else
    echo -e "file does not exist ... read inputs from standard input"
    readInputs
    echo -e "this information will be added: "
    echo -e "${WHITE}"
    printInputs
    echo -e "Select a number: "
    select CONFIRMATION in yes no quit; do
    case ${CONFIRMATION} in
    yes) echo -e "${ROSA}adding word:${WHITE} ${ENGLISH} .... "
           createEnglishFile
           saveEnglishTranslation
           createSpanishFile
           saveSpanishTranslation        
           saveVerb ${PAST} ${PASTPARTICIPE} ${GERUND}
           cat ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
           cat ${SPANISH_DIRECTORY_PATH}/${SPANISH}.txt
           break;;
    no) echo -e "${RED}you said no"
        break;;
    quit) break;;
    *) echo -e "${RED}Wrong keys";;
    esac
    done
  fi
done
```
