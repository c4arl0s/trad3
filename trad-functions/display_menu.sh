#!/usr/bin/env bash

display_menu()
{
  case ${decision} in 
  "yes")  echo -e "${GREEN}It will add word: ${ingles}"
          addWord ${espanol} ${ingles}
          LAST_WORD_FOUND=${ingles} ;;
  "no")   echo -e "${RED}You cancelled" ;;
  "add3") add3 ;; 
  *) 	    echo -e "${CYAN}You did type enter";;
  esac
}
