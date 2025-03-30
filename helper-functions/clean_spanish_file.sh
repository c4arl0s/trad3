#!/usr/bin/env bash

# Copyright 2024
# This script cleans Spanish word files by removing empty lines.

# Description:
# This function removes empty lines from Spanish word files.
# It uses a temporary file to perform the operation safely.

# Usage:
#   clean_spanish_file "word"

# Arguments:
#   word - The word whose file needs to be cleaned

# Returns:
#   0 if operation was successful
#   1 if an error occurred

clean_spanish_file() {
  local word="$1"
  local temp_file="/tmp/trad3_temporal.txt"
  local source_file="${SPANISH_DIRECTORY_PATH}/${word}.txt"
  local error_count=0

  # Check if word argument is provided
  if [[ -z "${word}" ]]; then
    echo "Error: Word argument is required" >&2
    return 1
  fi

  # Check if environment variable is defined
  if [[ -z "${SPANISH_DIRECTORY_PATH}" ]]; then
    echo "Error: SPANISH_DIRECTORY_PATH environment variable must be defined" >&2
    return 1
  fi

  # Check if source file exists
  if [[ ! -f "${source_file}" ]]; then
    echo "Error: Source file ${source_file} does not exist" >&2
    return 1
  fi

  # Remove empty lines and save to temporary file
  if ! sed '/^[[:space:]]*$/d' "${source_file}" > "${temp_file}"; then
    echo "Error: Failed to process file ${source_file}" >&2
    ((error_count++))
  fi

  # Copy temporary file back to source
  if ! cp "${temp_file}" "${source_file}"; then
    echo "Error: Failed to update file ${source_file}" >&2
    ((error_count++))
  fi

  # Clean up temporary file
  if [[ -f "${temp_file}" ]]; then
    rm "${temp_file}"
  fi

  if [[ ${error_count} -gt 0 ]]; then
    echo "Found ${error_count} errors during file cleaning" >&2
    return 1
  fi

  return 0
}
