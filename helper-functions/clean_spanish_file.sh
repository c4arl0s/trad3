#!/usr/bin/env bash

clean_spanish_file()
{
  word=$1
  # Delete empty lines
  sed "/^ *$/d" ${SPANISH_DIRECTORY_PATH}/${word}.txt > ${COMODIN_DIRECTORY_PATH}/temporal.txt
  cat ${COMODIN_DIRECTORY_PATH}/temporal.txt > ${SPANISH_DIRECTORY_PATH}/${word}.txt
}
