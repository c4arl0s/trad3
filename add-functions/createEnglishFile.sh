#!/usr/bin/env bash

createEnglishFile()
{
  touch ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
  chmod +x+w ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
}
