#!/usr/bin/env bash
# script to add new english words to my personal dictionary

. $HOME/iOS-Projects/trad3/directory_paths.sh

if [ $# -ne 0 ]; then
   echo -e "\nYou should not provide any argument in this script, you just type add3"
   return 
fi

while :
do
  print_header $(basename $0)
  if $(is_retrievable_english_word ${ENGLISH}); then
    echo "${GREEN}$ENGLISH exist"
    echo -e "${WHITE}"
    cat ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
    echo -e "${RED}"
    printf "%s" "Do you wish to add another meaning? type: [yes/no/edit]?: "; read option
    case ${option} in
    "yes") echo -e "${RED}"
           read_inputs
           echo "${GREEN}these are your changes: "
           print_inputs
           printf "%s" "Type yes to confirm: "; read option
           case ${option} in 
               "yes") echo -e "${RED}Saving ${ENGLISH} ..."
                      saveEnglishTranslation
                      clean_english_file ${ENGLISH}
                      saveSpanishTranslation 
                      save_verb ${PAST} ${PASTPARTICIPE} ${GERUND}
                      clean_spanish_file ${SPANISH}
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
    read_inputs
    echo -e "this information will be added: "
    echo -e "${WHITE}"
    print_inputs
    echo -e "Select a number: "
    select confirmation in yes no quit; do
    case ${confirmation} in
    yes) echo -e "${ROSA}adding word:${WHITE} ${ENGLISH} .... "
           create_english_file
           saveEnglishTranslation
           create_spanish_file
           saveSpanishTranslation        
           save_verb ${PAST} ${PASTPARTICIPE} ${GERUND}
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
