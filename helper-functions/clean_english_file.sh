#!/usr/bin/env bash

clean_english_file()
{
  word=$1
  # delete empty lines
  sed '/^ *$/d' ${ENGLISH_DIRECTORY_PATH}/${word}.txt > ${TEMPORAL_DIRECTORY_PATH}/temporal.txt
  cat ${TEMPORAL_DIRECTORY_PATH}/temporal.txt > ${ENGLISH_DIRECTORY_PATH}/${word}.txt
}
