#!/usr/bin/env bash

# Copyright 2024
# This script converts MP3 audio files to WAV format.

# Description:
# This function converts an MP3 audio file to WAV format using ffmpeg.
# It checks for the existence of the source file before attempting conversion.

# Usage:
#   convert_mp3_to_wav "word"

# Arguments:
#   word - The word whose audio file needs to be converted

# Returns:
#   0 if conversion was successful
#   1 if an error occurred

convert_mp3_to_wav() {
  local word="$1"
  local input_file="${AUDIO_DIRECTORY_PATH}/${word}.mp3"
  local output_file="${AUDIO_DIRECTORY_PATH}/${word}.wav"
  local error_count=0

  # Check if word argument is provided
  if [[ -z "${word}" ]]; then
    echo "Error: Word argument is required" >&2
    return 1
  fi

  # Check if environment variable is defined
  if [[ -z "${AUDIO_DIRECTORY_PATH}" ]]; then
    echo "Error: AUDIO_DIRECTORY_PATH environment variable must be defined" >&2
    return 1
  fi

  # Check if input file exists
  if [[ ! -f "${input_file}" ]]; then
    echo "Error: Input file ${input_file} does not exist" >&2
    return 1
  fi

  # Check if ffmpeg is installed
  if ! command -v ffmpeg >/dev/null 2>&1; then
    echo "Error: ffmpeg is not installed" >&2
    return 1
  fi

  echo "Converting ${word}.mp3 to WAV format..."

  # Convert MP3 to WAV
  if ! ffmpeg -i "${input_file}" "${output_file}" >/dev/null 2>&1; then
    echo "Error: Failed to convert ${word}.mp3 to WAV" >&2
    ((error_count++))
  fi

  # Verify output file was created
  if [[ ! -f "${output_file}" ]]; then
    echo "Error: Output file ${output_file} was not created" >&2
    ((error_count++))
  fi

  # Report result
  if [[ ${error_count} -eq 0 ]]; then
    echo -e "${GREEN}Successfully converted ${word}.mp3 to WAV format${NC}"
    return 0
  else
    echo -e "${RED}Conversion failed with ${error_count} errors${NC}"
    return 1
  fi
}
