#!/usr/bin/env bash

# Copyright 2024
# This script adds new words and their translations to the dictionary.

# Description:
# This function adds a new word and its translation to both English and Spanish files.
# It includes user confirmation before making changes.

# Usage:
#   add_word "translation" "english_word"

# Arguments:
#   translation - The translation to add
#   english_word - The English word to add

# Returns:
#   0 if operation was successful
#   1 if an error occurred

add_word() {
  local translation="$1"
  local english_word="$2"
  local error_count=0

  # Check if required arguments are provided
  if [[ -z "${translation}" ]] || [[ -z "${english_word}" ]]; then
    echo "Error: Both translation and English word are required" >&2
    return 1
  fi

  # Get translation and store result
  if ! get_translation "${translation}" "${english_word}"; then
    echo "Error: Failed to get translation" >&2
    return 1
  fi

  # Print the translation for user review
  print_added_translation

  # Get user confirmation
  printf "%s" "Is this correct? (press ENTER to confirm): "
  read -r confirmation

  # Process based on user confirmation
  if [[ -z "${confirmation}" ]]; then
    echo -e "${PINK}"
    echo -e "${WHITE}Adding word: ${english_word}"

    # Create and populate English file
    if ! create_english_file "${english_word}"; then
      echo "Error: Failed to create English file" >&2
      ((error_count++))
    fi

    if ! transfer_english_translation; then
      echo "Error: Failed to transfer English translation" >&2
      ((error_count++))
    fi

    # Create and populate Spanish file
    if ! create_spanish_file "${SPANISH}"; then
      echo "Error: Failed to create Spanish file" >&2
      ((error_count++))
    fi

    if ! transfer_spanish_translation; then
      echo "Error: Failed to transfer Spanish translation" >&2
      ((error_count++))
    fi

    # Check for any errors during the process
    if [[ ${error_count} -gt 0 ]]; then
      echo "Found ${error_count} errors during word addition" >&2
      return 1
    fi

    echo -e "${GREEN}Word added successfully${NC}"
    return 0
  else
    echo "Operation cancelled by user"
    return 0
  fi
}
