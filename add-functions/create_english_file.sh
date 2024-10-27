#!/usr/bin/env bash

create_english_file()
{
  touch ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
  chmod +x+w ${ENGLISH_DIRECTORY_PATH}/${ENGLISH}.txt
}
