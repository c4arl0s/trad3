#!/usr/bin/env bash

# Deletes a file if it is empty or contains only whitespace.
# Usage:
#   delete_file_if_empty_or_blank "/absolute/or/relative/path.txt"
delete_file_if_empty_or_blank() {
  local file_path=$1

  if [[ -z "${file_path}" ]]; then
    echo "Error: file path parameter is required" >&2
    return 1
  fi

  if [[ ! -f "${file_path}" ]]; then
    echo "Error: file does not exist: ${file_path}" >&2
    return 1
  fi

  # Remove file when it has no non-whitespace characters.
  if [[ ! -s "${file_path}" ]] || [[ -z "$(tr -d '[:space:]' < "${file_path}")" ]]; then
    rm "${file_path}" && echo "${file_path} was removed successfully"
    return 0
  fi

  return 0
}
