#!/usr/bin/env bash

clean_spanish_file()
{
  SPANISH_FILE=$1
  # remove empty lines
  echo "directory ${SPANISH_DIRECTORY_PATH}"
  sed "/^ *$/d" ${SPANISH_DIRECTORY_PATH}/${SPANISH_FILE}.txt > ${COMODIN_DIRECTORY_PATH}/temporal.txt
  cat ${COMODIN_DIRECTORY_PATH}/temporal.txt > ${SPANISH_DIRECTORY_PATH}/${SPANISH_FILE}.txt
}
