#!/usr/bin/env bash

printAddedTranslation()
{
    echo -e "${AMARILLO}Datos ingresados:"
    echo -e "${BLANCO}ENGLISH :${ROSAFONDONEGRO} $ingles "
    echo -e "${BLANCO}SPANISH :${ROSAFONDONEGRO} $espanol "
    echo -e "${BLANCO}extra :${ROSAFONDONEGRO} $algomas "
    echo -e "${BLANCO}past :${ROSAFONDONEGRO} $p "
    echo -e "${BLANCO}past participe :${ROSAFONDONEGRO} $pp "
    echo -e "${BLANCO}gerund :${ROSAFONDONEGRO} $gerundio "
    echo -e "${BLANCO}example :${ROSAFONDONEGRO} $ejemplo "
    reproduceEnglishAudioFileIfAvailable $ingles
    echo -e "${BLANCO}"
}