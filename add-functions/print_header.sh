#!/usr/bin/env bash

print_header() 
{
  ORIGINAL_BASENAME=$1
  echo -e "${GREEN}${ORIGINAL_BASENAME} - SCRIPT to add words english-spanish${YELLOW}type ctrl-c to exit"
  printf "%s" "Add only one word in ENGLISH: "; read ENGLISH
}
