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

# Installation: 

Export this variable on your current profile file. pointing out the corresponding path.

```console
export TRAD3_PATH="$HOME/iOS-Projects/trad3/"
```

Then create a function

```console
trad3() {
  . ${TRAD3_PATH}/trad3.sh
}
```

# Invoke script by only typing:

```console
$ trad3
```

# trad3.sh Code

```bash
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
```

# add3.sh code

```bash
#!/usr/bin/env bash
# script to add new english words to my personal dictionary

. ${TRAD3_PATH}/directory_paths.sh

handle_existing_word() {
  echo "${GREEN}$ENGLISH exist"
  echo -e "${WHITE}"
  cat ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
  echo -e "${RED}"
  printf "%s" "Do you wish to add another meaning? type: [yes/no/edit]?: "; read option
  
  case ${option} in
      "yes") 
          handle_add_meaning
          ;;
      "no") 
          echo -e "Create a task when you say no"
          ;;
      "edit") 
          vim ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
          vim ${SPANISH_DIRECTORY_PATH}/${SPANISH}.txt
          ;;
      *) 
          echo -e "${RED}type correct key"
          ;;
  esac
}

handle_add_meaning() {
  echo -e "${RED}"
  read_inputs
  echo "${GREEN}these are your changes: "
  print_inputs
  printf "%s" "Type yes to confirm: "; read option
  
  case ${option} in 
    "yes") 
        echo -e "${RED}Saving ${ENGLISH} ..."
        save_english_translation
        clean_english_file ${ENGLISH}
        save_spanish_translation 
        save_verb ${PAST} ${PASTPARTICIPE} ${GERUND}
        clean_spanish_file ${SPANISH}
        cat ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
        ;;
    "no") 
        echo -e "${RED}"
        echo -e "${RED}You cancelled operation"
        ;;
    *) 
        echo -e "${RED}Type correct key"
        ;;
  esac
}

handle_new_word() {
  echo -e "file does not exist ... read inputs from standard input"
  read_inputs
  echo -e "this information will be added: "
  echo -e "${WHITE}"
  print_inputs
  echo -e "Select a number: "
  
  select confirmation in yes no quit; do
    case ${confirmation} in
      yes) 
          echo -e "${ROSA}adding word:${WHITE} ${ENGLISH} .... "
          create_english_file
          save_english_translation
          create_spanish_file
          save_spanish_translation        
          save_verb ${PAST} ${PASTPARTICIPE} ${GERUND}
          cat ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
          cat ${SPANISH_DIRECTORY_PATH}/${SPANISH}.txt
          break
          ;;
      no) 
          echo -e "${RED}you said no"
          break
          ;;
      quit) 
          break
          ;;
      *) 
          echo -e "${RED}Wrong keys"
          ;;
    esac
  done
}

main() {
  if [ $# -ne 0 ]; then
    echo -e "\nYou should not provide any argument in this script, you just type add3"
    return 
  fi
  
  delete_empty_files

  while true; do
    print_header $(basename $0)
    
    if $(is_retrievable_english_word ${ENGLISH}); then
        handle_existing_word
    elif [ -z "${ENGLISH}" ]; then 
        echo -e "${CYAN}Empty word"
    else
        handle_new_word
    fi
  done
}

main "$@"
```
