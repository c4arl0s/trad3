#!/usr/bin/env bash

PROJECT_PATH="$HOME/iOS-Projects/trad3"

# new english version
COMODIN_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary"
ENGLISH_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary/english"
AUDIO_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary/audio-words"
SPANISH_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary/spanish"

TEMPORAL_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary"

. ${PROJECT_PATH}/helper-functions/clean_english_file.sh
. ${PROJECT_PATH}/helper-functions/colors.sh
. ${PROJECT_PATH}/helper-functions/clean_spanish_file.sh

# trad-functions

# new english version
. ${PROJECT_PATH}/trad-functions/print_title.sh
. ${PROJECT_PATH}/trad-functions/is_retrievable_english_word.sh
. ${PROJECT_PATH}/trad-functions/is_retrievable_english_audio.sh
. ${PROJECT_PATH}/trad-functions/download_audio_from_google.sh
. ${PROJECT_PATH}/trad-functions/convert_mp3_to_wav.sh
. ${PROJECT_PATH}/trad-functions/is_retrievable_spanish_word.sh
. ${PROJECT_PATH}/trad-functions/display_spanish_translation.sh
. ${PROJECT_PATH}/trad-functions/format_english_file.sh
. ${PROJECT_PATH}/trad-functions/count_lines_spanish_file.sh
. ${PROJECT_PATH}/trad-functions/get_spanish_fields.sh
. ${PROJECT_PATH}/trad-functions/print_spanish_fields.sh
. ${PROJECT_PATH}/trad-functions/search_word_using_google_script.sh
. ${PROJECT_PATH}/trad-functions/display_option_to_add_new_word.sh
. ${PROJECT_PATH}/trad-functions/display_menu.sh
. ${PROJECT_PATH}/trad-functions/get_english_fields.sh
. ${PROJECT_PATH}/trad-functions/display_english_translation.sh
. ${PROJECT_PATH}/trad-functions/reproduce_audio.sh
. ${PROJECT_PATH}/trad-functions/reproduce_english_audio_file_if_available.sh
. ${PROJECT_PATH}/trad-functions/reproduce_last_word_found_if_available.sh
. ${PROJECT_PATH}/trad-functions/print_english_fields.sh
. ${PROJECT_PATH}/trad-functions/add_word.sh
. ${PROJECT_PATH}/trad-functions/transfer_spanish_translation.sh
. ${PROJECT_PATH}/trad-functions/transfer_english_translation.sh
. ${PROJECT_PATH}/trad-functions/get_translation.sh
. ${PROJECT_PATH}/trad-functions/print_added_translation.sh
. ${PROJECT_PATH}/trad-functions/create_spanish_file.sh
. ${PROJECT_PATH}/trad-functions/create_english_file.sh
. ${PROJECT_PATH}/trad-functions/get_number_of_lines_english_file.sh
. ${PROJECT_PATH}/trad-functions/is_available.sh

# add-functions

. ${PROJECT_PATH}/add-functions/printHeader.sh
. ${PROJECT_PATH}/add-functions/readInputs.sh
. ${PROJECT_PATH}/add-functions/printInputs.sh
. ${PROJECT_PATH}/add-functions/create_english_file.sh
. ${PROJECT_PATH}/add-functions/create_spanish_file.sh
. ${PROJECT_PATH}/add-functions/saveEnglishTranslation.sh
. ${PROJECT_PATH}/add-functions/saveSpanishTranslation.sh
. ${PROJECT_PATH}/add-functions/saveVerb.sh
