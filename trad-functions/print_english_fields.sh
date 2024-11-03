#!/usr/bin/env bash

print_english_fields()
{
    echo -e "${WHITE}$ENGLISH:${PINK} ${SPANISH}"
    echo -e "${WHITE}Extra:${GREEN} ${EXTRA}"
    if [[ ! -z "${P}" ]] && [[ ! -z "${PP}" ]] && [[ ! -z "${G}" ]] && [[ ! -z "${E}" ]]; then
      echo -e "${WHITE}Past:${GREEN} $P"
      echo -e "${WHITE}Past Participe:${GREEN} ${PP}"
      echo -e "${WHITE}Gerund:${GREEN} ${G}"
    fi
    echo -e "${WHITE}Example:${GREEN} ${E}"
}
