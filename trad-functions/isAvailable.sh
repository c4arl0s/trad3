#!/usr/bin/env bash

isAvailable()
{
  WORD=$1
  test -f ${ENGLISH_DIRECTORY_PATH}/${WORD}.txt
  ANSWER=$?
  return ${ANSWER}
}
