#!/usr/bin/env bash

printAddedTranslation()
{
  echo -e "${AMARILLO}All entered data:"
  echo -e "${BLANCO}ENGLISH :${ROSAFONDONEGRO} ${ENGLISH} "
  echo -e "${BLANCO}SPANISH :${ROSAFONDONEGRO} ${SPANISH} "
  echo -e "${BLANCO}extra :${ROSAFONDONEGRO} ${algomas} "
  echo -e "${BLANCO}past :${ROSAFONDONEGRO} ${p} "
  echo -e "${BLANCO}past participe :${ROSAFONDONEGRO} ${pp} "
  echo -e "${BLANCO}gerund :${ROSAFONDONEGRO} ${gerundio} "
  echo -e "${BLANCO}example :${ROSAFONDONEGRO} ${ejemplo} "
  reproduce_english_audio_file_if_available ${ENGLISH}
  echo -e "${BLANCO}"
}
