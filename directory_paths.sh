#!/usr/bin/env bash

# new english version
COMODIN_DIRECTORY_PATH="${TRAD3_PATH}/vocabulary"
ENGLISH_DIRECTORY_PATH="${TRAD3_PATH}/vocabulary/english"
AUDIO_DIRECTORY_PATH="${TRAD3_PATH}/vocabulary/audio-words"
SPANISH_DIRECTORY_PATH="${TRAD3_PATH}/vocabulary/spanish"

TEMPORAL_DIRECTORY_PATH="${TRAD3_PATH}/vocabulary"

. ${TRAD3_PATH}/helper-functions/clean_english_file.sh
. ${TRAD3_PATH}/helper-functions/colors.sh
. ${TRAD3_PATH}/helper-functions/clean_spanish_file.sh

# trad-functions

# new english version
. ${TRAD3_PATH}/trad-functions/print_title.sh
. ${TRAD3_PATH}/trad-functions/is_retrievable_english_word.sh
. ${TRAD3_PATH}/trad-functions/is_retrievable_english_audio.sh
. ${TRAD3_PATH}/trad-functions/download_audio_from_google.sh
. ${TRAD3_PATH}/trad-functions/convert_mp3_to_wav.sh
. ${TRAD3_PATH}/trad-functions/is_retrievable_spanish_word.sh
. ${TRAD3_PATH}/trad-functions/display_spanish_translation.sh
. ${TRAD3_PATH}/trad-functions/format_english_file.sh
. ${TRAD3_PATH}/trad-functions/count_lines_spanish_file.sh
. ${TRAD3_PATH}/trad-functions/get_spanish_fields.sh
. ${TRAD3_PATH}/trad-functions/print_spanish_fields.sh
. ${TRAD3_PATH}/trad-functions/search_word_using_google_script.sh
. ${TRAD3_PATH}/trad-functions/display_option_to_add_new_word.sh
. ${TRAD3_PATH}/trad-functions/display_menu.sh
. ${TRAD3_PATH}/trad-functions/get_english_fields.sh
. ${TRAD3_PATH}/trad-functions/display_english_translation.sh
. ${TRAD3_PATH}/trad-functions/reproduce_audio.sh
. ${TRAD3_PATH}/trad-functions/reproduce_english_audio_file_if_available.sh
. ${TRAD3_PATH}/trad-functions/reproduce_last_word_found_if_available.sh
. ${TRAD3_PATH}/trad-functions/print_english_fields.sh
. ${TRAD3_PATH}/trad-functions/add_word.sh
. ${TRAD3_PATH}/trad-functions/transfer_spanish_translation.sh
. ${TRAD3_PATH}/trad-functions/transfer_english_translation.sh
. ${TRAD3_PATH}/trad-functions/get_translation.sh
. ${TRAD3_PATH}/trad-functions/print_added_translation.sh
. ${TRAD3_PATH}/trad-functions/create_spanish_file.sh
. ${TRAD3_PATH}/trad-functions/create_english_file.sh
. ${TRAD3_PATH}/trad-functions/get_number_of_lines_english_file.sh
. ${TRAD3_PATH}/trad-functions/is_available.sh

# add-functions

. ${TRAD3_PATH}/add-functions/print_header.sh
. ${TRAD3_PATH}/add-functions/read_inputs.sh
. ${TRAD3_PATH}/add-functions/print_inputs.sh
. ${TRAD3_PATH}/add-functions/create_english_file.sh
. ${TRAD3_PATH}/add-functions/create_spanish_file.sh
. ${TRAD3_PATH}/add-functions/save_english_translation.sh
. ${TRAD3_PATH}/add-functions/save_spanish_translation.sh
. ${TRAD3_PATH}/add-functions/save_verb.sh
