#!/usr/bin/env bash

function get_number_of_lines_english_file()
{
  WORD=$1
  FILE_NAME="${ENGLISH_DIRECTORY_PATH}/${WORD}.txt"
  NUMBER_OF_LINES=`echo $(<${FILE_NAME}) | wc -l | cut -f 8 -d " "`
  echo ${NUMBER_OF_LINES}
}
