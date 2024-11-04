#!/usr/bin/env bash

clean_spanish_file()
{
  spanish_word=$1
  # remove empty lines
  echo "directory ${SPANISH_DIRECTORY_PATH}"
  sed "/^ *$/d" ${SPANISH_DIRECTORY_PATH}/${SPANISH_FILE}.txt > /tmp/trad3_temporal.txt
  cat /tmp/trad3_temporal.txt > ${SPANISH_DIRECTORY_PATH}/${spanish_word}.txt
}
