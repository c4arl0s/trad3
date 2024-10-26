#!/usr/bin/env bash

PROJECT_PATH="$HOME/iOS-Projects/trad3"

# new english version
COMODIN_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary"
ENGLISH_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary/english"
AUDIO_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary/audio-words"
SPANISH_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary/spanish"

TEMPORAL_DIRECTORY_PATH="${PROJECT_PATH}/vocabulary"

. ${PROJECT_PATH}/helper-functions/cleanEnglishFile.sh
. ${PROJECT_PATH}/helper-functions/colors.sh
. ${PROJECT_PATH}/helper-functions/cleanSpanishFile.sh

# trad-functions

# new english version
. ${PROJECT_PATH}/trad-functions/print_title.sh
. ${PROJECT_PATH}/trad-functions/is_retrievable_english_word.sh
. ${PROJECT_PATH}/trad-functions/isRetrievableEnglishAudio.sh
. ${PROJECT_PATH}/trad-functions/downloadAudioFromGoogle.sh
. ${PROJECT_PATH}/trad-functions/convertMP3toWAV.sh
. ${PROJECT_PATH}/trad-functions/isRetrievableSpanishWord.sh
. ${PROJECT_PATH}/trad-functions/displaySpanishTranslation.sh
. ${PROJECT_PATH}/trad-functions/formatEnglishFile.sh
. ${PROJECT_PATH}/trad-functions/countLinesSpanishFile.sh
. ${PROJECT_PATH}/trad-functions/getSpanishFields.sh
. ${PROJECT_PATH}/trad-functions/printSpanishFields.sh
. ${PROJECT_PATH}/trad-functions/searchWordUsingGoogleScript.sh
. ${PROJECT_PATH}/trad-functions/displayOptionToAddNewWord.sh
. ${PROJECT_PATH}/trad-functions/displayMenu.sh
. ${PROJECT_PATH}/trad-functions/getEnglishFields.sh
. ${PROJECT_PATH}/trad-functions/displayEnglishTranslation.sh
. ${PROJECT_PATH}/trad-functions/reproduce-audio.sh
. ${PROJECT_PATH}/trad-functions/reproduceEnglishAudioFileIfAvailable.sh
. ${PROJECT_PATH}/trad-functions/reproduceLastWordFoundIfAvailable.sh
. ${PROJECT_PATH}/trad-functions/printEnglishFields.sh
. ${PROJECT_PATH}/trad-functions/addWord.sh
. ${PROJECT_PATH}/trad-functions/transferSpanishTranslation.sh
. ${PROJECT_PATH}/trad-functions/transferEnglishTranslation.sh
. ${PROJECT_PATH}/trad-functions/getTranslation.sh
. ${PROJECT_PATH}/trad-functions/printAddedTranslation.sh
. ${PROJECT_PATH}/trad-functions/createSpanishFile.sh
. ${PROJECT_PATH}/trad-functions/createEnglishFile.sh
. ${PROJECT_PATH}/trad-functions/getNumberOfLinesEnglishFile.sh
. ${PROJECT_PATH}/trad-functions/isAvailable.sh

# add-functions

. ${PROJECT_PATH}/add-functions/printHeader.sh
. ${PROJECT_PATH}/add-functions/readInputs.sh
. ${PROJECT_PATH}/add-functions/printInputs.sh
. ${PROJECT_PATH}/add-functions/createEnglishFile.sh
. ${PROJECT_PATH}/add-functions/createSpanishFile.sh
. ${PROJECT_PATH}/add-functions/saveEnglishTranslation.sh
. ${PROJECT_PATH}/add-functions/saveSpanishTranslation.sh
. ${PROJECT_PATH}/add-functions/saveVerb.sh
