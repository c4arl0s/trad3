#!/usr/bin/env bash

is_retrievable_english_word()
{
  WORD=$1
  # if WORD exist, returns 0
  test -f ${ENGLISH_DIRECTORY_PATH}/${WORD}.txt
}

