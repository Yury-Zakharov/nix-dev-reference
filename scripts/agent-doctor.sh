#!/usr/bin/env bash
set -euo pipefail

fail() {
  echo "FAIL: $1"
  exit 1
}

command -v gemini >/dev/null || fail "gemini not found"
command -v claude >/dev/null || fail "claude not found"
command -v pass >/dev/null || fail "pass not found"

if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
  fail "ANTHROPIC_API_KEY not set (direnv?)"
fi

if [[ ! -d "$HOME/.gemini" ]]; then
  fail "Gemini not authenticated (~/.gemini missing)"
fi

echo "OK: agents are ready"
