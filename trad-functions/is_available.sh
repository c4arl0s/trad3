#!/usr/bin/env bash

is_available()
{
  WORD=$1
  test -f ${ENGLISH_DIRECTORY_PATH}/${WORD}.txt
  ANSWER=$?
  return ${ANSWER}
}
