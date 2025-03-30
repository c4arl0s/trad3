#!/usr/bin/env bash

print_spanish_fields() {
  # Imprimir siempre la traducción principal
  echo -e "${INGLES}:${ESPANOL}"
  
  # Imprimir solo las variables que no estén vacías
  [[ -n "${EXTRA}" ]] && echo -e "${WHITE}Extra:${GREEN} ${EXTRA}"
  [[ -n "${P}" ]] && echo -e "${WHITE}Past:${GREEN} ${P}"
  [[ -n "${PP}" ]] && echo -e "${WHITE}Past Participe:${GREEN} ${PP}"
  [[ -n "${G}" ]] && echo -e "${WHITE}Gerund:${GREEN} ${G}"
  [[ -n "${E}" ]] && echo -e "${WHITE}Example:${GREEN} ${E}"
}
