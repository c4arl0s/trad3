#!/usr/bin/env bash

function getNumberOfLinesEnglishFile()
{
  WORD=$1
  FILE_NAME="${ENGLISH_DIRECTORY_PATH}/${WORD}.txt"
  NUMBER_OF_LINES=`echo $(<${FILE_NAME}) | wc -l | cut -f 8 -d " "`
  echo ${NUMBER_OF_LINES}
}
