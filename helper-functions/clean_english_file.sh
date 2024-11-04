#!/usr/bin/env bash

clean_english_file()
{
  word=$1
  # delete empty lines
  sed '/^ *$/d' ${ENGLISH_DIRECTORY_PATH}/${word}.txt > /tmp/trad3_temporal.txt
  cat /tmp/trad3_temporal.txt > ${ENGLISH_DIRECTORY_PATH}/${word}.txt
}
