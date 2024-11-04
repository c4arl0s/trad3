#!/usr/bin/env bash

clean_spanish_file()
{
  word=$1
  # Delete empty lines
  sed "/^ *$/d" ${SPANISH_DIRECTORY_PATH}/${word}.txt > /tmp/trad3_temporal.txt
  cat /tmp/trad3_temporal.txt > ${SPANISH_DIRECTORY_PATH}/${word}.txt
}
