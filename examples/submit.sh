#!/usr/bin/env bash
set -euo pipefail
: "${MUAPI_API_KEY:?Set MUAPI_API_KEY first}"
curl --fail-with-body -sS -X POST https://api.muapi.ai/api/v1/minimax-music-3.0 \
  -H "Content-Type: application/json" \
  -H "x-api-key: $MUAPI_API_KEY" \
  -d '{"prompt": "An upbeat synth-pop anthem with driving drums and a soaring chorus", "lyrics": "[Verse]\nWalking through the city lights\n\n##\n[Chorus]\nWe are shining, we are free"}'
