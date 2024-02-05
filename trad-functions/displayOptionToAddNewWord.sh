#!/usr/bin/env bash

displayOptionToAddNewWord()
{
  printf "\n${WHITE}${espanol} : ${ingles}"
  printf "\n${CYAN}Do you want to add this word?:${PINK} ${WORD} ?"
  printf "%s" "Type your choice [yes|add3|↩(ignore)]: "; read decision
  echo -e "${GREEN}"
}
