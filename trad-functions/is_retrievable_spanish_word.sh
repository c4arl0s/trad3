#!/usr/bin/env bash

is_retrievable_spanish_word()
{
  WORD=$1
  # If SPANISH exist, returns 0
  test -f ${SPANISH_DIRECTORY_PATH}/${WORD}.txt
}
