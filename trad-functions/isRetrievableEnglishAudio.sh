#!/usr/bin/env bash

isRetrievableEnglishAudio()
{
  WORD=$1
  # If WORD exist, returns 0
  test -f ${AUDIO_DIRECTORY_PATH}/${WORD}.wav
}
