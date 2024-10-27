#!/usr/bin/env bash

is_retrievable_english_audio()
{
  WORD=$1
  # If WORD exist, returns 0
  test -f ${AUDIO_DIRECTORY_PATH}/${WORD}.wav
}
