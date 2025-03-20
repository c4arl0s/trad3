#!/usr/bin/env bash

# Copyright 2024
# This script deletes empty files in the specified language directories.

# Description:
# This function searches and deletes empty files in English and Spanish directories.
# Uses environment variables ENGLISH_DIRECTORY_PATH and SPANISH_DIRECTORY_PATH.

# Usage:
#   delete_empty_files

# Returns:
#   0 if operation was successful
#   1 if an error occurred

delete_empty_files() {
  local empty_file
  local error_count=0
  local failed_files=()

  # Check if environment variables are defined
  if [[ -z "${ENGLISH_DIRECTORY_PATH}" ]] || [[ -z "${SPANISH_DIRECTORY_PATH}" ]]; then
    echo "Error: Environment variables ENGLISH_DIRECTORY_PATH and SPANISH_DIRECTORY_PATH must be defined" >&2
    return 1
  fi

  echo "Performing cleanup..."
  # Delete empty files in English directory
  while read -r empty_file; do
    if ! rm "${empty_file}"; then
      echo "Error deleting file: ${empty_file}" >&2
      failed_files+=("${empty_file}")
      ((error_count++))
    fi
  # < <(...): Proceso de sustitución que permite leer la salida del comando
  done < <(find "${ENGLISH_DIRECTORY_PATH}" -type f -empty)

  # Delete empty files in Spanish directory
  while read -r empty_file; do
    if ! rm "${empty_file}"; then
      echo "Error deleting file: ${empty_file}" >&2
      failed_files+=("${empty_file}")
      ((error_count++))
    fi
  # # < <(...): Proceso de sustitución que permite leer la salida del comando
  done < <(find "${SPANISH_DIRECTORY_PATH}" -type f -empty)

  # Show summary of files that could not be deleted
  if [[ ${#failed_files[@]} -gt 0 ]]; then
    echo -e "\nSummary of files that could not be deleted:"
    printf '%s\n' "${failed_files[@]}"
    echo -e "\nTotal files not deleted: ${#failed_files[@]}"
  fi

  if [[ ${error_count} -gt 0 ]]; then
    echo "Found ${error_count} errors during file deletion" >&2
    return 1
  fi

  return 0
}
