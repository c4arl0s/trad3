#!/usr/bin/env bash

search_word_using_google_script()
{
  word=$1
  local _script_dir _mymemory _tout _tspan _teng

  _script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  _mymemory="${_script_dir}/translate_en_to_es_mymemory.sh"

  printf "\n${YELLOW}I´m gonna look using trans script, brief option\n"

  _tspan=""
  if command -v trans >/dev/null 2>&1; then
    if _tout=$(trans -b :es "${word}" 2>/dev/null); then
      _tspan=$(printf '%s\n' "${_tout}" | cut -f 1 -d " ")
    fi
  fi
  if [[ -z "${_tspan}" ]]; then
    echo "trans unavailable or failed; using MyMemory (en→es)." >&2
    if ! _tspan=$("${_mymemory}" "${word}"); then
      echo "Error: could not translate with trans or MyMemory." >&2
      return 1
    fi
  fi
  spanish_word_using_trans=${_tspan}

  if [ "${word}" = "${spanish_word_using_trans}" ]
  then
      printf "\nIt seems the word you are looking for It is the same as spanish word"
      _teng=""
      if command -v trans >/dev/null 2>&1; then
        if _tout=$(trans -b :eng "${word}" 2>/dev/null); then
          _teng=$(printf '%s\n' "${_tout}" | cut -f 1 -d " ")
        fi
      fi
      if [[ -z "${_teng}" ]]; then
        echo "trans unavailable or failed; using MyMemory (es→en)." >&2
        if ! _teng=$("${_mymemory}" -p "es|en" "${word}"); then
          echo "Error: could not translate to English with trans or MyMemory." >&2
          return 1
        fi
      fi
      english_word_using_trans=${_teng}
      espanol=${word}
      ingles=${english_word_using_trans}
  else
      printf "\nIt seems is an english word"
      espanol=${spanish_word_using_trans}
      ingles=${word}
  fi
}

# install trans script
# wget git.io/trans
# chmod +x ./trans
