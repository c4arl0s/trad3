#!/usr/bin/env bash
# MyMemory Translated public API (default: English → Spanish).
# Spec: https://mymemory.translated.net/ — GET https://api.mymemory.translated.net/get?q=…&langpair=…
# Requires: curl. Optional: jq; if missing, python3 parses JSON.
#
# Usage:
#   translate_en_to_es_mymemory.sh <English phrase>
#   translate_en_to_es_mymemory.sh -p es|en <Spanish phrase>

set -euo pipefail

usage() {
  echo "Usage: $(basename "$0") [-p|--langpair SRC|TGT] <word or phrase>" >&2
  echo "  Default langpair is en|es. Example: $(basename "$0") hello world" >&2
  echo "  Spanish→English: $(basename "$0") -p es|en hola" >&2
  exit 1
}

LANGPAIR="en|es"
while [[ $# -gt 0 ]]; do
  case "$1" in
    -p|--langpair)
      if [[ -z "${2:-}" ]]; then
        echo "Error: $1 requires a value (e.g. en|es or es|en)." >&2
        exit 1
      fi
      LANGPAIR="$2"
      shift 2
      ;;
    -h|--help)
      usage
      ;;
    *)
      break
      ;;
  esac
done

[[ $# -ge 1 ]] || usage

QUERY=$*
API_URL="https://api.mymemory.translated.net/get"

if ! BODY=$(curl -fsS -G \
  --data-urlencode "q=${QUERY}" \
  --data-urlencode "langpair=${LANGPAIR}" \
  "${API_URL}"); then
  echo "Error: could not reach the translation API." >&2
  exit 1
fi

if command -v jq >/dev/null 2>&1; then
  RS=$(echo "${BODY}" | jq -r '.responseStatus // 0')
  TX=$(echo "${BODY}" | jq -r '.responseData.translatedText // empty')
  if [[ "${RS}" != "200" ]]; then
    DET=$(echo "${BODY}" | jq -r '.responseDetails // empty')
    echo "API error (status ${RS}): ${DET:-no details}" >&2
    exit 1
  fi
  printf '%s\n' "${TX}"
else
  python3 -c '
import json, sys
d = json.loads(sys.stdin.read())
rs = d.get("responseStatus", 0)
if rs != 200:
    det = d.get("responseDetails") or "no details"
    sys.stderr.write("API error (status %s): %s\n" % (rs, det))
    sys.exit(1)
rd = d.get("responseData") or {}
print(rd.get("translatedText") or "")
' <<<"${BODY}"
fi
