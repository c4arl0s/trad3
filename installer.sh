#!/usr/bin/env bash
set -euo pipefail

# Absolute path to the repository root (directory containing this script).
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="/usr/local/bin"

TRAD3_SOURCE="${REPO_DIR}/trad3.sh"
TRAD3_LINK="${BIN_DIR}/trad3"
ADD3_SOURCE="${REPO_DIR}/add3.sh"
ADD3_LINK="${BIN_DIR}/add3"

if [[ ! -f "${TRAD3_SOURCE}" ]]; then
  echo "Error: trad3.sh not found in ${REPO_DIR}" >&2
  exit 1
fi

if [[ ! -f "${ADD3_SOURCE}" ]]; then
  echo "Error: add3.sh not found in ${REPO_DIR}" >&2
  exit 1
fi

if [[ ! -d "${BIN_DIR}" ]]; then
  echo "Error: ${BIN_DIR} does not exist" >&2
  exit 1
fi

chmod +x "${TRAD3_SOURCE}" "${ADD3_SOURCE}"

create_symlink() {
  local source=$1
  local target=$2
  if [[ -w "${BIN_DIR}" ]]; then
    ln -sf "${source}" "${target}"
  else
    sudo ln -sf "${source}" "${target}"
  fi
  echo "Symlink created: ${target} -> ${source}"
}

create_symlink "${TRAD3_SOURCE}" "${TRAD3_LINK}"
create_symlink "${ADD3_SOURCE}" "${ADD3_LINK}"
