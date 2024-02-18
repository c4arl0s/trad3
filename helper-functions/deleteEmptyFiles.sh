#!/usr/bin/env bash

deleteEmptyFiles() 
{
   find ${ENGLISH_DIRECTORY_PATH} -type f -empty | while read EMPTY_FILE; do rm ${EMPTY_FILE}; done
   find ${SPANISH_DIRECTORY_PATH} -type f -empty | while read EMPTY_FILE; do rm ${EMPTY_FILE}; done
}
