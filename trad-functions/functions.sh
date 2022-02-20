#!/bin/bash

# new english version
. ./trad-functions/printTitle.sh
. ./trad-functions/isRetrievableEnglishWord.sh
. ./trad-functions/isRetrievableEnglishAudio.sh
. ./trad-functions/downloadAudioFromGoogle.sh
. ./trad-functions/convertMP3toWAV.sh
. ./trad-functions/isRetrievableSpanishWord.sh
. ./trad-functions/displaySpanishTranslation.sh
. ./trad-functions/formatEnglishFile.sh
. ./trad-functions/countLinesSpanishFile.sh
. ./trad-functions/getSpanishFields.sh
. ./trad-functions/printSpanishFields.sh
. ./trad-functions/searchWordUsingGoogleScript.sh
. ./trad-functions/displayOptionToAddNewWord.sh
. ./trad-functions/displayMenu.sh
. ./trad-functions/getEnglishFields.sh
. ./trad-functions/displayEnglishTranslation.sh
. ./trad-functions/reproduce-audio.sh

# old spanish version
. ./trad-functions/imprimir-traduccion-ingresada.sh
. ./trad-functions/descargar-audio-de-google.sh
. ./trad-functions/existe-archivo-en-espanol.sh
. ./trad-functions/existe-archivo-en-ingles.sh
. ./trad-functions/agregar-palabra.sh
. ./trad-functions/transfiere-traduccion-espanol.sh
. ./trad-functions/crear-archivo-espanol.sh
. ./trad-functions/transfiere-traduccion-ingles.sh
. ./trad-functions/crear-archivo-ingles.sh
. ./trad-functions/obtener-traduccion.sh
. ./trad-functions/cuenta-lineas-archivo-ingles.sh
. ./trad-functions/imprimir-campos-ingles.sh
. ./trad-functions/prueba-existencia.sh
